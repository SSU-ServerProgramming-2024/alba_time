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
                  color: Colors.redAccent,
                  width: 300,
                  height: 50,
                  margin: EdgeInsets.all(25),
                  child: Text('아무개', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,),
                ),
                Container(
                  alignment: Alignment.center,
                  color: Colors.redAccent,
                  width: 300,
                  height: 50,
                  margin: EdgeInsets.all(25),
                  child: Text('21세', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
                ),
                Container(
                  alignment: Alignment.center,
                  color: Colors.redAccent,
                  width: 300,
                  height: 50,
                  margin: EdgeInsets.all(25),
                  child: Text('2024-05-01', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
                ),
                Container(
                  alignment: Alignment.center,
                  color: Colors.redAccent,
                  width: 300,
                  height: 50,
                  margin: EdgeInsets.all(25),
                  child: Text('12000원', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
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
