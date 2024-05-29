import 'package:alba_time/profile.dart';
import 'package:alba_time/provider/myProfileProvider.dart';
import 'package:flutter/material.dart';
import 'add_emp_info.dart';
import 'list_emp.dart';
import 'login.dart';
import 'modify_emp_info.dart';
import 'timeTable.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => MyProfileProvider(),
          ),
        ],
        child: MaterialApp(
          title: "Alba Time",
          initialRoute: '/login',
          routes: {
            '/login': (context) => LoginPage(),
            '/timetable': (context) => const TimeTablePage(),
            '/profile': (context) => Profile(),
            '/listemp': (context) => ListEmp(),
            '/addinfopage': (context) => AddInfoPage(),
            '/modinfopage': (context) => ModInfoPage()
          },
          home: LoginPage()
        ),
      ),
    );
  }
}