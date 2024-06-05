import 'package:alba_time/provider/myProfileProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'api/apiService.dart';

class AddInfoPage extends StatefulWidget {
  @override
  State<AddInfoPage> createState() => _AddInfoPageState();
}

class _AddInfoPageState extends State<AddInfoPage> {
  late ApiService apiService;
  late MyProfileProvider _myProfileProvider;

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final startDateController = TextEditingController();
  final salaryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    _myProfileProvider = Provider.of<MyProfileProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('아르바이트생 정보 추가'),
        elevation: 0.0,
        backgroundColor: Colors.teal.shade200,
        centerTitle: true,
        //leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        //actions: <Widget>[
        //  IconButton(icon: Icon(Icons.search), onPressed: () {}),
        //],
      ),
      body: SingleChildScrollView(
        child: Row(
          children:[
            const Spacer(),
            Column(
              children: <Widget>[
                const SizedBox(height: 80),
                const Text('아르바이트생 정보 입력', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

                const SizedBox(height: 30),
                Container(
                  alignment: Alignment.center,
                  color: Colors.white12,
                  width: 300,
                  height: 50,
                  margin: const EdgeInsets.all(25),
                  child: TextField(
                    controller: nameController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: '이름을 입력하세요.',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  color: Colors.white12,
                  width: 300,
                  height: 50,
                  margin: const EdgeInsets.all(25),
                  child: TextField(
                    controller: ageController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: '나이를 입력하세요.',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  color: Colors.white12,
                  width: 300,
                  height: 50,
                  margin: const EdgeInsets.all(25),
                  child: TextField(
                    controller: startDateController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: '근무 시작 날짜를 입력하세요.',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  color: Colors.white12,
                  width: 300,
                  height: 50,
                  margin: const EdgeInsets.all(25),
                  child: TextField(
                    controller: salaryController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: '시급을 입력하세요.',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      //if button clicks,
                      final response = await apiService.createWorker(_myProfileProvider.getBossNo(), nameController.text, ageController.text, startDateController.text, salaryController.text);
                      if (response?.statusCode == 200 || response?.statusCode == 201) {
                        Navigator.pop(context);
                      } else {
                        print(response?.statusCode);
                      }
                    },
                    child: const Text('등록'),
                ),
              ],
          ),
            const Spacer()
          ]
        )
      ),
    );
  }
}
