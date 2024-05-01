import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        elevation: 0.0,
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
              padding: EdgeInsets.only(left: 50),
              child: Column(
                children: <Widget>[
                    SizedBox(height:32),
                    Text('이름 :', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    Text('나이 :', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                )
              ),
              SizedBox(
                width: 30,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height:32),
                  Text('홍길동', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Text('33세', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(height:32),
              Text('점포 정보', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height:32),
              Container(
                  alignment: Alignment.center,
                  color: Colors.redAccent,
                  width: 300,
                  height: 50,
                  child: Text('맥도날드', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
              ),
              Container(
                  alignment: Alignment.center,
                  color: Colors.redAccent,
                  width: 300,
                  height: 50,
                  margin: EdgeInsets.all(50),
                  child: Text('서울특별시 동작구 상도로 280', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
              ),
              Container(
                  alignment: Alignment.center,
                  color: Colors.redAccent,
                  width: 300,
                  height: 50,
                  child: Text('패스트푸드', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
              ),
            ],
          ),
        ],
      ),
    );
  }
}
