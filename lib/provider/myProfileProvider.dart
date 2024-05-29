import 'package:flutter/material.dart';

// ChangeNotifier 상속 받이 상태 관리
// 이 안에 있는 맴버 변수 값들을 상태 관리 한다.
class MyProfileProvider extends ChangeNotifier{
  int _userId = 0;
  int _bossNo = 0;
  String _name = "";
  int _compno = 0;
  String _com_name = "";
  String _com_loc = "";
  int _type = 0;
  int _age = 0;


  int get userId => _userId;
  String get name => _name;
  int get compno => _compno;
  String get com_name => _com_name;
  String get com_loc => _com_loc;
  int get type => _type;
  int get age => _age;

  setUserId(int userId){
    _userId = userId;
    notifyListeners(); // notifyListeners 호출해 업데이트된 값을 구독자에게 알림
  }

  setBossno(int bossNo){
    _bossNo = bossNo;
    notifyListeners();
  }

  int getUserId(){
    return _userId;
  }

  int getBossNo(){
    return _bossNo;
  }

  setMetaData(String name, com_name, com_loc, int compno, type, age){
    _name = name;
    _compno = compno;
    _com_name = com_name;
    _com_loc = com_loc;
    _type = type;
    _age = age;
    notifyListeners();
  }

}