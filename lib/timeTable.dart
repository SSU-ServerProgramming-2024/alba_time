import 'package:auto_size_text/auto_size_text.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:simkb/Src/Model/Database.dart';
//import 'package:simkb/Src/Utility/Global.dart';
//import 'package:simkb/Src/Utility/Tool.dart';

import '../model/timeBlockModel.dart';
import 'tableWeekView.dart';

class TimeTablePage extends StatefulWidget {
  const TimeTablePage({super.key});

  @override
  State<TimeTablePage> createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  @override
  void initState() {
    super.initState();
    /*
    DatabaseHelper.instance.getClassTable().then((value) {
      Tool.formatClassTableToEvents(value);
    });
    */
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        elevation: 0.0,
        backgroundColor: Colors.teal.shade200,
        centerTitle: true,
        //leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.person), onPressed: () {
            Navigator.of(context).pushNamed('/profile');
          })
        ],
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(10),
          child:Text('알바 시간표', style: TextStyle(fontSize: 18, color:Colors.black, fontWeight: FontWeight.bold)),
          ),
          Expanded(
              child: Container(
                height: 400,
                child: TableWeekView(
                  minDay: DateTime.now(),
                  scrollOffset: 450,
                  safeAreaOption: const SafeAreaOption(bottom: false),
                  maxDay: DateTime.now().add(const Duration(days: 7 * 20 - 1)),
                  initialDay: DateTime.now(),
                  weekTitleHeight: 70,
                  eventTileBuilder: (date, events, boundary, startDuration, endDuration) {
                    return _buildEvent(events, boundary);
                  },
                )
              )
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child:ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade200, //background color of button
                  side: const BorderSide(width:3, color:Colors.brown), //border width and color
                  elevation: 3, //elevation of button
                  shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(30)
                  ),
                  padding: const EdgeInsets.all(20) //content padding inside button
              ),
              onPressed: (){
                //code to execute when this button is pressed.

                Navigator.of(context).pushNamed('/listemp');
              },
              child: Container(
                  alignment: Alignment.center,
                  width: 400,
                  child: const Text('알바생 목록', style:TextStyle(fontSize: 18, color:Colors.white)))
            )
          )
        ])
    );
  }

  Widget _buildEvent(List<CalendarEventData<Object?>> events, Rect boundary) {
    if (events.isEmpty) return Container();
    TimeBlockModel event = events.first.event as TimeBlockModel;
    return GestureDetector(
      onTap: () {
        _showDetail(event);
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          children: [
            AutoSizeText(
              event.userName ?? "",
              style: const TextStyle(color: Colors.black),
              maxLines: boundary.height < 50 ? 1 : 4,
              minFontSize: 8,
              maxFontSize: 11,
            ),
            SizedBox(
              height: boundary.height < 50 ? 5 : 10,
            ),
            AutoSizeText(
              event.userName ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
              maxLines: boundary.height < 100 ? 1 : 2,
              minFontSize: 8,
              maxFontSize: 10,
            ),
          ],
        ).paddingAll(5),
      ),
    );
  }

  void _showDetail(TimeBlockModel event) {
    Widget _buildBottomSheet(
        BuildContext context,
        ScrollController scrollController,
        double bottomSheetOffset,
        ) {
      return Material(
        child: ListView(
          controller: scrollController,
          shrinkWrap: true,
          children: [
            CourseDetail(course: event),
          ],
        ),
      );
    }

    showFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.8,
      maxHeight: 0.8,
      context: context,
      builder: _buildBottomSheet,
      isExpand: false,
    );
  }
}

class CourseDetail extends StatelessWidget {
  final TimeBlockModel course;
  const CourseDetail({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
                child: Text(
                  course.userName ?? "-",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ).paddingOnly(top: 20, bottom: 10))
          ],
        ),
        Row(
          children: [
            Image.asset(
              'images/time.png',
              height: 35,
              width: 35,
            ).paddingOnly(right: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "time:",
                  style: TextStyle(color: Colors.grey),
                ),
                Text("${course.date}  ${course.startTime} ~ ${course.endTIme}")
              ],
            )
          ],
        ).paddingOnly(top: 20, bottom: 10),
      ],
    ).paddingOnly(left: 20, bottom: 20, right: 20);
  }
}