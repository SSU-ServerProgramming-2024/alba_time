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
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: TimeTablePage(), // TODO : change to LoginPage
        )
    );
  }
}