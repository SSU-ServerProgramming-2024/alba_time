import 'package:alba_time/profile.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'timeTable.dart';
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
            '/profile': (context) => Profile(),
          },
          home: LoginPage(),
        )
    );
  }
}