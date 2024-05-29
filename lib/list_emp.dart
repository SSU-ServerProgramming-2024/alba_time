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
                final employee = emplist[index];
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
                      child: Text(employee['name'], style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black)),
                    ),
                    SizedBox(height: 20),
                  ],
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                //if button clicks,
                print("pressed");
              },
              child: Text('알바생 추가', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
