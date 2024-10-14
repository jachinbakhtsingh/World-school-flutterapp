import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

//const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class FullDay extends StatefulWidget {
  const FullDay({Key? key}) : super(key: key);

  @override
  State<FullDay> createState() => _FullDayState();
}

class _FullDayState extends State<FullDay> {
  DateTimeRange? myDateRange;
  final List<String> items = [
    'Function',
    'Health Problem',
    'Personal Work',
    'Casual Leave',
    'other',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    TextEditingController _date = TextEditingController();

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
        DateRangeField(
            enabled: true,
            initialValue: DateTimeRange(
                start: DateTime.now(),
                end: DateTime.now().add(Duration(days: 1))),
            decoration: InputDecoration(
              labelText: 'Date Range',
              prefixIcon: Icon(Icons.date_range),
              hintText: 'Please select a start and end date',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.start.isBefore(DateTime.now())) {
                return 'Please enter a later start date';
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                myDateRange = value!;
              });
            }),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(hintText: "Reason"),
        ),
      ]),
    );
  }
}
