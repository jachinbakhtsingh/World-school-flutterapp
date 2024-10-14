import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:intl/intl.dart';

import 'full_day_leave.dart';
import 'half_day_leave.dart';

class ApplyLeave extends StatefulWidget {
  const ApplyLeave({
    Key? key,
  }) : super(key: key);

  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  bool type = false;
  String _selectedGender = 'male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03A375),
        title: Text("Apply Leave"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(6),
            child: GestureDetector(
              onTap: () {
                setState(() => type = !type);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Checkbox(
                      //secondary: Text("Apply for Halfday"),
                      value: type,
                      onChanged: (value) {
                        setState(() => type = !type);
                      }),
                  Text("Apply for Halfday")
                ],
              ),
            ),
          ),
          //FullDay()
          type ? HalfDay() : FullDay()
        ],
      ),
    );
  }
}
