import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class overall extends StatefulWidget {
  const overall({Key? key}) : super(key: key);

  @override
  State<overall> createState() => _overallState();
}

class _overallState extends State<overall> {
  List<dynamic> year = [];
  String? yearId;

  @override
  void initState() {
    super.initState();
    this.year.add({"id": 1, "label": "2022 - 2023 "});
    this.year.add({"id": 2, "label": "2023 - 2024"});
    this.year.add({"id": 3, "label": "2024 - 2025"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Overall"),
        centerTitle: true,
        toolbarHeight: 60,
        elevation: 20,
        backgroundColor: const Color(0xff03A375),
        actions: <Widget>[],
      ),
      body: Container(
        child: Column(
          children: [
            FormHelper.dropDownWidgetWithLabel(
              context,
              "Academic Year",
              "Select the year",
              this.yearId,
              this.year,
              (onChangedVal) {
                this.yearId = onChangedVal;
              },
              (onValidateVal) {
                if (onValidateVal == null) {
                  return 'please Select gender';
                }
                return null;
              },
              prefixIcon: Icon(Icons.home),
              borderColor: Colors.black,
              borderFocusColor: Colors.black,
              borderRadius: 15,
              optionValue: "id",
              optionLabel: "label",
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 2.0,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              width: 350,
              height: 100,
              color: Color(0xFFC8E6C9),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      "Total Enquiry Recieved",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "1554",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            Container(
              width: 350,
              height: 100,
              color: Color(0xFFC8E6C9),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      " Enquiry Today",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "1",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}
