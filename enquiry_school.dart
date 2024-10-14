import 'package:flutter/material.dart';

import '../constants.dart';
//import 'districtmodel.dart';

class school extends StatefulWidget {
  const school({Key? key}) : super(key: key);

  @override
  State<school> createState() => _schoolState();
}

class _schoolState extends State<school> {
  List<districtmodel> values = [
    districtmodel("S_no", "SchoolName", "Count"),
    districtmodel("1", "Fx_School", "56"),
    districtmodel("2", "RoseMarry_School", "78"),
    districtmodel("3", "Bell_School", "8"),
    districtmodel("4", "Sst_School", "8"),
    districtmodel("5", "Scad_School", "8"),
    districtmodel("6", "Psn_School", "8"),
    districtmodel("7", "Mp_School", "8"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff03A375),
          title: Text('School Wise Report '),
        ),
        body: SafeArea(
          child: Container(
            child: ListView.builder(
              itemCount: values.length,
              itemBuilder: (BuildContext context, int index) {
                return district_details(
                  values[index].S_no,
                  values[index].school_name,
                  values[index].Count_school,
                );
              },
            ),
          ),
        ));
  }
}

Widget district_details(String S_no, String school_name, String Count_school) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: ListTile(
              title: Text(
                S_no,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                school_name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                Count_school,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      Divider(
        thickness: 2.0,
      )
    ],
  );
}

class districtmodel {
  late String school_name, S_no, Count_school;

  districtmodel(this.S_no, this.school_name, this.Count_school);
}
