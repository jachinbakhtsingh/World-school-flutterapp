import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Attendance/student_list.dart';

import 'package:myapp/Attendance/subject_teacher_data.dart';
import 'package:myapp/Attendance/subject_teacher_widget.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';

class subject_screen extends StatelessWidget {
  const subject_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03A375),
        title: Text('Subject List'),
      ),
      body: Column(
        children: [
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
                  itemCount: assignment.length,
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
                                      assignment[index].subjectName,
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                kHalfSizedBox,
                                Text(
                                  assignment[index].topicName,
                                  style: TextStyle(
                                      color: kTextBlackColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0),
                                ),
                                kHalfSizedBox,
                                AssignmentDetailRow(
                                  title: ' Date',
                                  statusValue: assignment[index].assignDate,
                                ),
                                kHalfSizedBox,
                                AssignmentDetailRow(
                                  title: 'Session',
                                  statusValue: assignment[index].lastDate,
                                ),
                                kHalfSizedBox,
                                AssignmentDetailRow(
                                    title: 'Status',
                                    statusValue: assignment[index].status),
                                kHalfSizedBox,
                                if (assignment[index].status == 'Pending')
                                  AssignButton(
                                    onPress: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => student()));
                                    },
                                    title: 'Take Attendance',
                                  ),
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
