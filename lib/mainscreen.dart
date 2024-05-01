import 'package:flutter/material.dart';
import 'package:flutter_timetable/flutter_timetable.dart';

import 'package:intl/intl.dart';
import 'dart:math';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //final items = generateItems();
  final controller = TimetableController(
    start: DateUtils.dateOnly(DateTime.now()).subtract(const Duration(days: 7)),
    initialColumns: 7,
    cellHeight: 100.0,
    startHour: 9,
    endHour: 18,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(const Duration(milliseconds: 100), () {
        controller.jumpTo(DateTime.now());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
        elevation: 0.0,
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.person), onPressed: () {})
        ],
      ),
      body: Column(
        children:[
          Container(
            //padding: const EdgeInsets.all(10),
            height: 600,
            child: Timetable<String>(
            controller: controller,
            //items: items,
            cellBuilder: (datetime) => Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey, width: 0.2),
              ),
              child: Center(
                child: Text(
                  DateFormat("MM/d/yyyy\nha").format(datetime),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            cornerBuilder: (datetime) => Container(
              color: Colors.accents[datetime.day % Colors.accents.length],
              child: Center(child: Text("${datetime.year}")),
            ),
            headerCellBuilder: (datetime) {
              final color = Colors.primaries[datetime.day % Colors.accents.length];
              return Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: color, width: 2)),
                ),
                child: Center(
                  child: Text(
                    DateFormat("E\nMMM d").format(datetime),
                    style: TextStyle(
                      color: color,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
            hourLabelBuilder: (time) {
              final hour = time.hour == 12 ? 12 : time.hour % 12;
              final period = time.hour < 12 ? "am" : "pm";
              final isCurrentHour = time.hour == DateTime.now().hour;
              return Text(
                "$hour$period",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isCurrentHour ? FontWeight.bold : FontWeight.normal,
                ),
              );
            },
              /*
            itemBuilder: (item) => Container(
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(220),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  item.data ?? "",
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),*/
            nowIndicatorColor: Colors.red,
            snapToDay: true,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("알바생 조회"),
          ),
        ]
      )
    );
  }
}


/// Generates some random items for the timetable.
/*
List<TimetableItem<String>> generateItems() {
  final random = Random();
  final items = <TimetableItem<String>>[];
  final today = DateUtils.dateOnly(DateTime.now());
  for (var i = 0; i < 100; i++) {
    int hourOffset = random.nextInt(56 * 24) - (7 * 24);
    final date = today.add(Duration(hours: hourOffset));
    items.add(TimetableItem(
      date,
      date.add(Duration(minutes: (random.nextInt(8) * 15) + 15)),
      data: "item $i",
    ));
  }
  return items;
}
*/