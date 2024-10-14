import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class Profile_Reports extends StatefulWidget {
  const Profile_Reports({Key? key}) : super(key: key);

  @override
  State<Profile_Reports> createState() => _Profile_formState();
}

class _Profile_formState extends State<Profile_Reports> {
  int _value = 1;

  TextEditingController _date = TextEditingController();
  List<dynamic> countries = [];
  String? countryId;
  @override
  void initState() {
    super.initState();
    this.countries.add({"id": 1, "label": "Male"});
    this.countries.add({"id": 2, "label": "Female"});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Report_form"),
        centerTitle: true,
        toolbarHeight: 60,
        elevation: 20,
        backgroundColor: const Color(0xff03A375),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: TextStyle(color: Colors.white),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Submit",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(top: 25.0, right: 10.0, bottom: 25.0, left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Enter Your Name',
                hintText: 'Full Name',
                icon: Icon(Icons.person),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                labelText: "Register Number ",
                hintText: "123456",
                icon: Icon(FontAwesomeIcons.registered),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                labelText: "Admission Number ",
                hintText: "012345",
                icon: Icon(FontAwesomeIcons.school),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                labelText: "Admission class ",
                hintText: "X-II",
                icon: Icon(FontAwesomeIcons.book),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                labelText: "Admission year",
                hintText: "2022-2021",
                icon: Icon(FontAwesomeIcons.list),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            TextField(
                controller: _date,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: "Date of Birth"),
                onTap: () async {
                  DateTime? pickeddate = await showDatePicker(
                      context: (context),
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2101));
                  if (pickeddate != null) {
                    setState(() {
                      _date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                    });
                  }
                }),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                labelText: "Enter Mobile Number ",
                hintText: "Mobil Number",
                icon: Icon(FontAwesomeIcons.phone),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: " Enter the email",
                hintText: "123@gmail.com",
                icon: Icon(Icons.mail),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: "Enter Father Name",
                hintText: "Father Name",
                icon: Icon(Icons.person_sharp),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: "Enter Mother Name",
                hintText: "Mother Name",
                icon: Icon(Icons.person_sharp),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: "Enter Mark ",
                hintText: "100%",
                icon: Icon(Icons.percent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
