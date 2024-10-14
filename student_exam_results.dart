import 'package:flutter/material.dart';

class StudentResults extends StatelessWidget {
  const StudentResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03A375),
        title: Text("Result"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 20,
              margin: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Name : Rajesh"),
                  Text("Roll No : 123243"),
                ],
              ),
            ),
            Tables(),
          ],
        ),
      ),
    );
  }
}

class Tables extends StatelessWidget {
  const Tables({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          DataTable(columns: [
            DataColumn(label: Text("Subject")),
            DataColumn(label: Text("Theory")),
            DataColumn(label: Text("Practical")),
            DataColumn(label: Text("Total"))
          ], rows: const [
            DataRow(
              cells: [
                DataCell(Text(
                  "English",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text("-")),
                DataCell(Text("100")),
                DataCell(Text("100"))
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text(
                  "Tamil",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text("-")),
                DataCell(Text("100")),
                DataCell(Text("100"))
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text(
                  "Maths",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text("-")),
                DataCell(Text("100")),
                DataCell(Text("100"))
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text(
                  "Science",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text("25")),
                DataCell(Text("75")),
                DataCell(Text("100"))
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text(
                  "Total",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text("")),
                DataCell(Text("")),
                DataCell(Text(
                  "400",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))
              ],
            )
          ])
        ],
      ),
    );
  }
}
