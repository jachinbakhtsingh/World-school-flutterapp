import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class Marks extends StatefulWidget {
  const Marks({Key? key}) : super(key: key);

  @override
  State<Marks> createState() => _GenderState();
}

class _GenderState extends State<Marks> {
  String dropdownValue = 'Quartely Marks';
  bool isDescending = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFC8E6C9),
      appBar: AppBar(
        backgroundColor: const Color(0xff03A375),
        title: Text("Marks"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            /* DropdownButton<String>(
              value: dropdownValue,
              // icon: const Icon(Icons.arrow_downward),
              elevation: 25,
              alignment: Alignment.centerRight,

              style: const TextStyle(color: Colors.black),

              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Quartely Marks', 'Halfly Marks']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),*/
            TextButton.icon(
                onPressed: () {
                  setState(() => isDescending = !isDescending);
                },
                icon: RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.compare_arrows,
                    size: 28,
                  ),
                ),
                label: Text(
                  isDescending ? 'Descending' : 'Ascending',
                  style: TextStyle(fontSize: 16),
                )),
            Divider(
              indent: 10,
              endIndent: 10,
              thickness: 1,
            ),
            Container(
              width: double.infinity,
              child: ListStudentMark(isDescending: isDescending),
            ),
          ],
        ),
      ),
    );
  }
}

class ListStudentMark extends StatefulWidget {
  const ListStudentMark({Key? key, required this.isDescending})
      : super(key: key);
  final isDescending;

  @override
  State<ListStudentMark> createState() => _ListStudentMarkState();
}

class _ListStudentMarkState extends State<ListStudentMark> {
  final List<String> items = [
    'Anna Kovind Raj',
    'Brandon',
    'Emma',
    'Lucas',
    'Murphy'
  ];
  final List<String> rollno = ['123', '231', '2313', '4323', '23245'];
  final List<String> marks = ['70', '80', '90', '60', '50'];

  @override
  Widget build(BuildContext context) {
    final List<String> sortedItems =
        widget.isDescending ? items.reversed.toList() : items;
    final sortedrollno =
        widget.isDescending ? rollno.reversed.toList() : rollno;
    final sortedmarks = widget.isDescending ? marks.reversed.toList() : marks;
    return Container(
      width: double.infinity,
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        sortedItems[index],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        sortedrollno[index],
                        style: TextStyle(color: Colors.grey, fontSize: 18.0),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
                child: Text(
                  sortedmarks[index] + " %",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
