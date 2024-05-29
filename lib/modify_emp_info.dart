import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ModInfoPage extends StatefulWidget {
  @override
  State<ModInfoPage> createState() => _ModInfoPageState();
}

class _ModInfoPageState extends State<ModInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('알바생 정보 수정'),
        elevation: 0.0,
        backgroundColor: Colors.teal.shade200,
        centerTitle: true,
        //leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        //actions: <Widget>[
        //  IconButton(icon: Icon(Icons.search), onPressed: () {}),
        //],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 50),
              Text('홍길동', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

              SizedBox(height: 30),
              Container(
                color: Colors.white12,
                height: 50,

                child: Container(
                  child : Text('시작일 : 2022-10-10', style: TextStyle(fontSize: 22)),
                  ),
                ),
              SizedBox(height: 15),
              Container(
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    // 버튼이 클릭되었을 때 수행할 작업
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0), // 사각형의 모서리를 둥글게 만듦
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(color: Colors.black), // 테두리 색상
                    ),
                  ),
                  child: Text('12000원', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    // 버튼이 클릭되었을 때 수행할 작업
                    Navigator.of(context).pushNamed('/workinfo');
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0), // 사각형의 모서리를 둥글게 만듦
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(color: Colors.black), // 테두리 색상
                    ),
                  ),
                  child: const Text('총 근무 시간', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: 300,
                height: 100,
                child : Row(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        // Handle button press
                      },
                      child: const Text('-'),
                    ),
                    const SizedBox(width: 75),
                    const Text('결근 횟수', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 75),
                    ElevatedButton(
                      onPressed: () {
                        // Handle button press
                      },
                      child: Text('+'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const SizedBox(
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'review를 작성하세요',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.multiline,
                ),
              ),
              const SizedBox(height:10),
              Row(
                children: <Widget>[
                  const SizedBox(width:120),
                  ElevatedButton(
                    onPressed: () {
                      //if button clicks,
                      print("pressed");
                    },
                    child: const Text('review 등록'),
                  ),
                  const SizedBox(width:90),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
