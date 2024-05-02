import 'package:alba_time/profile.dart';
import 'package:flutter/material.dart';
import 'list_emp.dart';
import 'login.dart';
import 'timeTable.dart';
import 'add_emp_info.dart';
import 'modify_emp_info.dart';
import 'worktime_info.dart';
import 'package:calendar_view/calendar_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return CalendarControllerProvider(
        controller: EventController(),
        child: MaterialApp(
          title: "Alba Time",
          initialRoute: '/login',
          routes: {
            '/login': (context) => LoginPage(),
            '/timetable': (context) => const TimeTablePage(),
            '/profile': (context) => ProfilePage(),
            '/listemp': (context) => ListEmpPage(),
            '/addemp' : (context) => AddInfoPage(),
            '/modemp' : (context) => ModInfoPage(),
            '/workinfo': (context) => WorkInfoPage(),

          },
          home: LoginPage(),
        )
    );
  }
}