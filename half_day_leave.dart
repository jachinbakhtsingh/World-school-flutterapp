import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HalfDay extends StatefulWidget {
  const HalfDay({Key? key}) : super(key: key);

  @override
  State<HalfDay> createState() => _HalfDayState();
}

class _HalfDayState extends State<HalfDay> {
  final List<String> items = [
    'Function',
    'Health Problem',
    'Personal Work',
    'Casual Leave',
    'other',
  ];
  String? selectedValue;
  DateTimeRange? myDateRange;
  TextEditingController _date = TextEditingController();
  TextEditingController reason = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            hint: Text(
              'Leave Type',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            },
            buttonHeight: 40,
            buttonWidth: double.infinity,
            itemHeight: 40,
          ),
        ),
        TextField(
            style: TextStyle(color: Colors.black45),
            controller: _date,
            keyboardType: TextInputType.none,
            decoration: const InputDecoration(
                filled: true,
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
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: reason,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: "Reason",
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ]),
    );
  }
}
