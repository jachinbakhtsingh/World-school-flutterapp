import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:myapp/Time_Table/timetable_widget.dart';
import 'package:intl/intl.dart';
import '../constants.dart';

class timetable extends StatefulWidget {
  const timetable({Key? key}) : super(key: key);

  @override
  State<timetable> createState() => _timetableState();
}

class _timetableState extends State<timetable> {
  DateTimeRange? myDateRange;
  TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff03A375),
        title: Text('Time Table'),
      ),
      body: Column(
        children: [
          TextField(
              style: TextStyle(color: Colors.black45),
              keyboardType: TextInputType.none,
              controller: _date,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  icon: Icon(
                    Icons.calendar_today,
                    color: Colors.black87,
                  ),
                  labelText: "Select the Date"),
              onTap: () async {
                DateTime? pickeddate = await showDatePicker(
                    context: (context),
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1990),
                    lastDate: DateTime(2101));
                if (pickeddate != null) {
                  setState(() {
                    _date.text = DateFormat('dd-yyyy-MM').format(pickeddate);
                  });
                }
              }),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kOtherColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding),
                  topRight: Radius.circular(kDefaultPadding),
                ),
              ),
              child: ListView.builder(
                  padding: EdgeInsets.all(kDefaultPadding),
                  itemCount: table.length,
                  itemBuilder: (context, int index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: kDefaultPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(kDefaultPadding),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kDefaultPadding),
                              color: kOtherColor,
                              boxShadow: [
                                BoxShadow(
                                  color: kTextLightColor,
                                  blurRadius: 2.0,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: kSecondaryColor.withOpacity(0.4),
                                    borderRadius:
                                        BorderRadius.circular(kDefaultPadding),
                                  ),
                                  child: Center(
                                    child: Text(
                                      table[index].subjectName,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                kHalfSizedBox,
                                Text(
                                  table[index].topicName,
                                  style: TextStyle(
                                      color: kTextBlackColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0),
                                ),
                                kHalfSizedBox,
                                AssignmentRow(
                                  title: 'Period',
                                  statusValue: table[index].Period,
                                ),
                                kHalfSizedBox,
                                AssignmentRow(
                                  title: 'Duration',
                                  statusValue: table[index].periodduration,
                                ),
                                kHalfSizedBox,
                                AssignmentRow(
                                    title: 'Session',
                                    statusValue: table[index].session),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class timetableData {
  final String subjectName;
  final String topicName;
  final String periodduration;
  final String session;
  final String Period;

  timetableData(this.subjectName, this.topicName, this.periodduration,
      this.session, this.Period);
}

List<timetableData> table = [
  timetableData(
      'Biology', 'Teacher_name : Mrs.S.Jennifer', '9.00 - 9.50', 'FN', '1st'),
  timetableData(
      'Physics', 'Teacher_name :Dr.S.Samuel', '9.50 - 10.40', 'FN', '2nd'),
  timetableData(
      'Chemistry', 'Teacher_name:Dr.R.Reka', '10.55 - 11.20', 'FN', '3rd'),
  timetableData(
      'Mathematics', 'Teacher_name:Mr.S.Sudali', '11.20 - 12.00', 'FN', '4th'),
  timetableData(
      'Tamil', 'Teacher_name:Mrs.K.Kavitha', '12.00 - 12.40', 'FN', '5th'),
  timetableData(
      'English', 'Teacher_name:Mr.S.Suresh', '1.30 - 2.20', 'AN', '6th'),
  timetableData('Spoken English', 'Teacher_name:Dr.S.Sumithra', '2.20 - 3.05',
      'AN', '7th'),
  timetableData(
      'Extra Lab', 'Teacher_name:Mr.K.Kumar', '3.05 - 4.00', 'AN', '8th'),
];
