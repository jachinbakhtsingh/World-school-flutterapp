import 'package:flutter/material.dart';
import 'package:myapp/Enquiry_Report/marks.dart';

import 'community/community.dart';
import 'district.dart';
import 'enquiry_school.dart';
import 'gender_wise_report.dart';
import 'overview.dart';

class Enquiry_Report extends StatelessWidget {
  const Enquiry_Report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFC8E6C9),
        appBar: AppBar(
          backgroundColor: const Color(0xff03A375),
          title: Text('Enquiry Reports'),
        ),
        body: Container(
          margin: EdgeInsets.all(3.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Overall",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.black),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => overall()));
                  },
                ),
              ),
              SizedBox(
                height: 2,
              ),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    heightFactor: 10,
                    child: Text(
                      "Gender",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.black),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Gender()));
                  },
                ),
              ),
              SizedBox(
                height: 2,
              ),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Community",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.black),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => community()));
                  },
                ),
              ),
              SizedBox(
                height: 2,
              ),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "District",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.black),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => district()));
                  },
                ),
              ),
              SizedBox(
                height: 2,
              ),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Marks",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.black),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Marks()));
                  },
                ),
              ),
              SizedBox(
                height: 2,
              ),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "School",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.black),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => school()));
                  },
                ),
              )
            ],
          ),
        ));
  }
}
