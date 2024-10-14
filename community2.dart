import 'package:flutter/material.dart';

import 'community1.dart';

class FixedColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 10,
      headingRowColor: MaterialStateProperty.all(Colors.green[300]),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.lightGreen,
            width: 3,
          ),
        ),
      ),
      columns: [
        DataColumn(label: Text('Community')),
      ],
      rows: [
        ...teamsData.map((team) => DataRow(
              cells: [
                DataCell(Text(
                  '  ${team.name}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ],
            ))
      ],
    );
  }
}
