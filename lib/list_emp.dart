import 'package:flutter/material.dart';

class ListEmpPage extends StatefulWidget {
  @override
  State<ListEmpPage> createState() => _ListEmpPageState();
}

class _ListEmpPageState extends State<ListEmpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('아르바이트생 목록'),
        elevation: 0.0,
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        //leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        //actions: <Widget>[
        //  IconButton(icon: Icon(Icons.search), onPressed: () {}),
        //],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            Text('아르바이트생 목록', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ListView(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true, // ListView를 Column 안에서 사용할 때 필요
              physics: NeverScrollableScrollPhysics(), // ListView에서 스크롤을 사용하지 않음
              children: [
                ElevatedButton(
                  onPressed: () {
                    // 버튼이 클릭되었을 때 수행할 작업
                    Navigator.of(context).pushNamed('/modemp');
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(50, 50)), // 버튼의 최소 크기 지정
                    backgroundColor: MaterialStateProperty.all(Colors.white70), // 버튼의 배경색 지정
                  ),
                  child: Text('홍길동', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.black)),
                ),
                SizedBox(height:20),
                ElevatedButton(
                  onPressed: () {
                    // 버튼이 클릭되었을 때 수행할 작업
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(50, 50)), // 버튼의 최소 크기 지정
                    backgroundColor: MaterialStateProperty.all(Colors.white70), // 버튼의 배경색 지정
                  ),
                  child: Text('손흥민', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.black)),
                ),
                SizedBox(height:20),
                ElevatedButton(
                  onPressed: () {
                    // 버튼이 클릭되었을 때 수행할 작업
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(50, 50)), // 버튼의 최소 크기 지정
                    backgroundColor: MaterialStateProperty.all(Colors.white70), // 버튼의 배경색 지정
                  ),
                  child: Text('류현진', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.black)),
                ),
                SizedBox(height:20),
                ElevatedButton(
                  onPressed: () {
                    // 버튼이 클릭되었을 때 수행할 작업
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(50, 50)), // 버튼의 최소 크기 지정
                    backgroundColor: MaterialStateProperty.all(Colors.white70), // 버튼의 배경색 지정
                  ),
                  child: Text('오타니', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.black)),
                ),
                SizedBox(height:20),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                //if button clicks,
                print("pressed");
              },
              child: Text('알바생 추가', style: TextStyle(color: Colors.black)),
            ),
          //const Spacer(),
          ],
        ),
      ),
    );
  }
}
