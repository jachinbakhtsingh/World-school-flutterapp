import 'package:flutter/material.dart';

import '../constants.dart';
//import 'districtmodel.dart';

class district extends StatefulWidget {
  const district({Key? key}) : super(key: key);

  @override
  State<district> createState() => _districtState();
}

class _districtState extends State<district> {
  List<districtmodel> values = [
    districtmodel("S_no", "DistrictName", "Count"),
    districtmodel("1", "Madurai", "56"),
    districtmodel("2", "Chennai", "78"),
    districtmodel("3", "Tirunelveli", "8"),
    districtmodel("4", "Kovilpeeti", "8"),
    districtmodel("5", "Tiruchendur", "8"),
    districtmodel("6", "Palaykottai", "8"),
    districtmodel("7", "Pettai", "8"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff03A375),
          title: Text('District Wise Report '),
        ),
        body: SafeArea(
          child: Container(
            child: ListView.builder(
              itemCount: values.length,
              itemBuilder: (BuildContext context, int index) {
                return district_details(
                  values[index].S_no,
                  values[index].district_name,
                  values[index].Count_district,
                );
              },
            ),
          ),
        ));
  }
}

Widget district_details(
    String S_no, String district_name, String Count_district) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: ListTile(
              title: Text(
                S_no,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                district_name,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                Count_district,
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
  late String district_name, S_no, Count_district;

  districtmodel(this.S_no, this.district_name, this.Count_district);
}
