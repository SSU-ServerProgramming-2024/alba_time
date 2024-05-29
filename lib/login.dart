import 'package:alba_time/provider/myProfileProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api/apiService.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LogInState();
}

class _LogInState extends State<LoginPage> {
  late ApiService apiService;

  final idController = TextEditingController();
  final pwController = TextEditingController();

  late MyProfileProvider _myProfileProvider;

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
        title: const Text('Log in'),
        elevation: 0.0,
        backgroundColor: Colors.teal.shade200,
        centerTitle: true,
        //leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        //actions: <Widget>[
        //  IconButton(icon: Icon(Icons.search), onPressed: () {})
        //],
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 50)),
          Form(
              child: Theme(
                data: ThemeData(
                    primaryColor: Colors.grey,
                    inputDecorationTheme: const InputDecorationTheme(
                        labelStyle: TextStyle(color: Colors.teal, fontSize: 15.0))),
                child: Container(
                    padding: const EdgeInsets.all(40.0),
                    // 키보드가 올라와서 만약 스크린 영역을 차지하는 경우 스크롤이 되도록
                    // SingleChildScrollView으로 감싸 줌
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextField(
                            controller: idController,
                            decoration: const InputDecoration(labelText: '사용자 아이디'),
                            keyboardType: TextInputType.text,
                          ),
                          TextField(
                            controller: pwController,
                            decoration:
                            const InputDecoration(labelText: '사용자 비밀번호'),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true, // 비밀번호 안보이도록 하는 것
                          ),
                          const SizedBox(height: 40.0,),
                          ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final response = await apiService.loginAuth(idController.value.text, pwController.value.text);
                                  if (response?.statusCode == 200) {
                                    _myProfileProvider.setUserId(response!.result.userId);
                                    _myProfileProvider.setBossno(response!.result.bossNo);
                                    Navigator.of(context).pushNamed('/timetable');
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal.shade200,
                                ),
                                child: Container(
                                alignment: Alignment.center,
                                width: 200,
                                child: const Text('로그인', style:TextStyle(fontSize: 18, color:Colors.white))
                                ),
                              )
                          )
                        ],
                      ),
                    )),
              ))
        ],
      ),
    );
  }
}