import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api/apiService.dart';
import 'model/employeeInfoModel.dart';
import 'provider/myProfileProvider.dart';

class ListEmp extends StatefulWidget {
  @override
  State<ListEmp> createState() => _ListEmpState();
}

class _ListEmpState extends State<ListEmp> {
  late ApiService apiService;
  late MyProfileProvider _myProfileProvider;

  List<dynamic> emplist = [];

  @override
  void initState() {
    super.initState();
    apiService = ApiService();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _myProfileProvider = Provider.of<MyProfileProvider>(context, listen: false);

      final response = await apiService.getWorkerList(_myProfileProvider.getBossNo());
      if (response?.statusCode == 200) {
        setState(() {
          emplist = response?.result;
          print(emplist);
        });

      } else {
        print(response?.statusCode);
        print(response?.result);
      }
    });
  }

  void _fetchEmployees() async {
    _myProfileProvider = Provider.of<MyProfileProvider>(context, listen: false);
    final response = await apiService.getWorkerList(_myProfileProvider.getBossNo());
    if (response != null && response.statusCode == 200) {
      setState(() {
        emplist = response.result ?? [];
      });
    } else {
      print('Failed to load employees: ${response?.result}');
    }
  }

  void _deleteEmployee(String employeeId) async {
    final response = await apiService.deleteEmployee(employeeId);
    if (response.statusCode == 200) {
      // 삭제 성공 후 목록 재로딩
      _fetchEmployees();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete employee: ${response.result}'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('아르바이트생 목록'),
        elevation: 0.0,
        backgroundColor: Colors.teal.shade200,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            ListView.builder(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: emplist.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // 버튼이 클릭되었을 때 수행할 작업
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(50, 50)), // 버튼의 최소 크기 지정
                        backgroundColor: MaterialStateProperty.all(Colors.white70), // 버튼의 배경색 지정
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // Row의 크기를 내용물에 맞춤
                        children: <Widget>[
                          Spacer(),
                          Text(emplist[index]['name'], style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black)),
                          Spacer(),// 텍스트와 아이콘 버튼 사이의 공간
                          ElevatedButton(
                            onPressed: (){
                              _deleteEmployee(emplist[index]['albano'].toString());
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(EdgeInsets.all(0)), // 내부 여백 조절
                              minimumSize: MaterialStateProperty.all(Size(30, 30)), // 작은 버튼 크기 조정
                              backgroundColor: MaterialStateProperty.all(Colors.red), // 버튼의 배경색 지정
                            ),
                            child: Text('-', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.white)),
                          ), // 작은 아이콘 버튼
                        ],
                      ),
                      //child: Text(employee['name'], style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black)),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
            ElevatedButton(
              onPressed: () async {
                //if button clicks,
                print("pressed");
                await Navigator.of(context).pushNamed('/addinfopage');
                _fetchEmployees();
              },
              child: const Text('알바생 추가', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
