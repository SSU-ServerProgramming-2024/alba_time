import 'package:flutter/material.dart';

class WorkInfoPage extends StatefulWidget {
  @override
  State<WorkInfoPage> createState() => _WorkState();
}

class _WorkState extends State<WorkInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('총 근무 시간', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0.0,
        backgroundColor: Colors.teal.shade200,
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
            Row(
              children: [
                SizedBox(width:110),
                Text('홍길동',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(width:10),
                Text('출퇴근 정보',style: TextStyle(fontSize: 20,)),
              ],
            ),
            SizedBox(height: 10),
            ListView(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true, // ListView를 Column 안에서 사용할 때 필요
              physics: NeverScrollableScrollPhysics(), // ListView에서 스크롤을 사용하지 않음
              children: [
                Column(
                  children: <Widget>[
                      Text('2024년 03월 03일'),
                      SizedBox(height:10),
                      Row(
                        children: [
                          SizedBox(width:40),
                          Text('출근', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(width:20),
                          ElevatedButton(
                            onPressed: () {
                              //if button clicks,
                            },
                            child: Text('18:00', style: TextStyle(fontSize: 18, color: Colors.black)),
                          ),
                          SizedBox(width:20),
                          Text('퇴근', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(width:20),
                          ElevatedButton(
                            onPressed: () {
                              //if button clicks,
                            },
                            child: Text('23:00', style: TextStyle(fontSize: 18, color: Colors.black)),
                          ),
                        ],
                      ),
                  ],
                ),
                SizedBox(height:10),
                Column(
                  children: <Widget>[
                    Text('2024년 03월 06일'),
                    SizedBox(height:10),
                    Row(
                      children: [
                        SizedBox(width:40),
                        Text('출근', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(width:20),
                        ElevatedButton(
                          onPressed: () {
                            //if button clicks,
                          },
                          child: Text('17:00', style: TextStyle(fontSize: 18, color: Colors.black)),
                        ),
                        SizedBox(width:20),
                        Text('퇴근', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(width:20),
                        ElevatedButton(
                          onPressed: () {
                            //if button clicks,
                          },
                          child: Text('21:00', style: TextStyle(fontSize: 18, color: Colors.black)),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height:10),
                Column(
                  children: <Widget>[
                    Text('2024년 03월 09일'),
                    SizedBox(height:10),
                    Row(
                      children: [
                        SizedBox(width:40),
                        Text('출근', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(width:20),
                        ElevatedButton(
                          onPressed: () {
                            //if button clicks,
                          },
                          child: Text('17:00', style: TextStyle(fontSize: 18, color: Colors.black)),
                        ),
                        SizedBox(width:20),
                        Text('퇴근', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(width:20),
                        ElevatedButton(
                          onPressed: () {
                            //if button clicks,
                          },
                          child: Text('21:00', style: TextStyle(fontSize: 18, color: Colors.black)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height:20),
            ElevatedButton(
              onPressed: () {
                //if button clicks,
                print("pressed");
              },
              child: Text('근무시간 추가', style: TextStyle(color: Colors.black)),
            ),
            //const Spacer(),
          ],
        ),
      ),
    );
  }
}
