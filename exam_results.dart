import 'dart:math';

import 'package:flutter/material.dart';

class ExamResult extends StatelessWidget {
  final DataTableSource data = MyData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03A375),
        title: Text("Results"),
      ),
      body: Column(
        children: [
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('English')),
              DataColumn(label: Text('Tamil')),
              DataColumn(label: Text('Maths')),
              DataColumn(label: Text('Science')),
            ],
            source: data,
            header: Row(
              children: [Text("Exam Results")],
            ),
          )
        ],
      ),
    );
  }
}

class MyData extends DataTableSource {
  final List<Map<String, dynamic>> data = List.generate(
      50,
      (index) => {
            "id": index,
            "title": "name $index",
            "English": "80",
            "Tamil": "90",
            "Maths": "80",
            "Science": "100"
          });

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index]["id"].toString())),
      DataCell(Text(data[index]["title"].toString())),
      DataCell(Text(data[index]["English"].toString())),
      DataCell(Text(data[index]["Tamil"].toString())),
      DataCell(Text(data[index]["Maths"].toString())),
      DataCell(Text(data[index]["Science"].toString())),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
