import 'package:flutter/material.dart';
import 'package:myapp/login/login.dart';
//import 'package:myapp/subject_list.dart';
import 'package:myapp/Attendance/subject_teacher.dart';
import 'package:table_calendar/table_calendar.dart';

import '../main.dart';

class attendance extends StatefulWidget {
  const attendance({Key? key}) : super(key: key);

  @override
  State<attendance> createState() => _attendanceState();
}

class _attendanceState extends State<attendance> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03A375),
        title: Text('Attendance Entry'),
      ),
      body: TableCalendar(
        focusedDay: focusedDay,
        firstDay: DateTime(1990),
        lastDay: DateTime(2050),
        calendarFormat: format,
        onFormatChanged: (CalendarFormat _format) {
          setState(() {
            format = _format;
          });
        },
        daysOfWeekVisible: true,
        onDaySelected: (DateTime selectDay, DateTime focusDay) {
          setState(() {
            selectedDay = selectDay;
            focusedDay = focusDay;
          });
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => subject_screen()));
          print(focusedDay);
        },
        headerStyle: HeaderStyle(
            formatButtonVisible: true,
            titleCentered: true,
            formatButtonDecoration: BoxDecoration(
                //   color: Colors.black54,
                borderRadius: BorderRadius.circular(5.0)),
            formatButtonTextStyle: TextStyle(
              color: Colors.black,
            )),
      ),
    );
  }
}
