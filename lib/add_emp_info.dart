import 'package:flutter/material.dart';

class Add_info extends StatefulWidget {
  @override
  State<Add_info> createState() => _AddInfoState();
}

class _AddInfoState extends State<Add_info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add'),
        elevation: 0.0,
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Row(
          children:[
            const Spacer(),
            Column(
              children: <Widget>[
                const SizedBox(height: 80),
                Text('아르바이트생 정보 입력', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

                const SizedBox(height: 30),
                Container(
                  alignment: Alignment.center,
                  color: Colors.white12,
                  width: 300,
                  height: 50,
                  margin: EdgeInsets.all(25),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
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
                  margin: EdgeInsets.all(25),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
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
                  margin: EdgeInsets.all(25),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: '근무 시작 날짜를 입력하세요.',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  color: Colors.white12,
                  width: 300,
                  height: 50,
                  margin: EdgeInsets.all(25),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: '시급을 입력하세요.',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      //if button clicks,
                      print("pressed");
                    },
                    child: Text('등록'),
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
