import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(
    String application_name,
    int application_age,
    int application_phonenumber,
    String application_dob,
    String application_email,
    String father_occuption,
    String mother_occuption,
    int annual_income,
    String address,
    int pin_code,
    int admission_class,
    String gender,
    String father_name,
    String mother_name,
    int father_phonenumber,
    int mother_phonenumber) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8090/api/application_form'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'application_name': application_name.toString(),
      'application_age': application_age,
      'application_phonenumber': application_phonenumber,
      'application_dob': application_dob,
      'application_email': application_email,
      'father_occuption': father_occuption,
      'mother_occuption': mother_occuption,
      'annual_income': annual_income,
      'address': address,
      'pin_code': pin_code,
      'admission_class': admission_class,
      'gender': gender,
      'father_name': father_name,
      'mother_name': mother_name,
      'father_phonenumber': father_phonenumber,
      'mother_phonenumber': mother_phonenumber
    }),
  );
  if (response.statusCode == 201) {
    print(application_name);
    if (response.body.isNotEmpty) {
      print(response.body);
    } else {
      print('empty');
    }
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final String application_name;
  final int application_age;
  final int application_phonenumber;
  final String application_dob;
  final String application_email;
  final String father_occuption;
  final String mother_occuption;
  final int annual_income;
  final String address;
  final int pin_code;
  final int admission_class;
  final String gender;
  final String father_name;
  final String mother_name;
  final int father_phonenumber;
  final int mother_phonenumber;

  const Album({
    required this.application_name,
    required this.application_age,
    required this.application_phonenumber,
    required this.application_dob,
    required this.application_email,
    required this.father_occuption,
    required this.mother_occuption,
    required this.annual_income,
    required this.address,
    required this.pin_code,
    required this.admission_class,
    required this.gender,
    required this.father_name,
    required this.mother_name,
    required this.father_phonenumber,
    required this.mother_phonenumber,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      application_name: json['application_name'],
      application_age: json['application_age'],
      application_phonenumber: json['application_phonenumber'],
      application_dob: json['application_dob'],
      application_email: json['application_email'],
      father_occuption: json['father_occuption'],
      mother_occuption: json['mother_occuption'],
      annual_income: json['annual_income'],
      address: json['address'],
      pin_code: json['pin_code'],
      admission_class: json['admission_class'],
      gender: json['gender'],
      father_name: json['father_name'],
      mother_name: json['mother_name'],
      father_phonenumber: json['father_phonenumber'],
      mother_phonenumber: json['mother_phonenumber'],
    );
  }
}

class Application_form extends StatefulWidget {
  const Application_form({Key? key}) : super(key: key);

  @override
  State<Application_form> createState() => _Application_formState();
}

class _Application_formState extends State<Application_form> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController mobilenumber = TextEditingController();
  //TextEditingController dateofbirth = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController fathername = TextEditingController();
  TextEditingController mothername = TextEditingController();
  TextEditingController fatheroccpation = TextEditingController();
  TextEditingController motheroccupation = TextEditingController();
  TextEditingController fatherphonenumber = TextEditingController();
  TextEditingController motherphonenumber = TextEditingController();
  TextEditingController annualincome = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController admission = TextEditingController();
  TextEditingController gender = TextEditingController();
  int _value = 1;
  Future<Album>? _futureAlbum;

  TextEditingController date = TextEditingController();
  List<dynamic> countries = [];
  String? countryId;
  @override
  void initState() {
    super.initState();
    this.countries.add({"id": 1, "label": "Male"});
    this.countries.add({"id": 2, "label": "Female"});
  }

  Widget build(BuildContext context) {
    var vyy;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Application_form"),
        centerTitle: true,
        toolbarHeight: 60,
        elevation: 20,
        backgroundColor: const Color(0xff03A375),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
            onPressed: () {
              print(name.text);
              _futureAlbum = createAlbum(
                name.text,
                int.parse(age.text),
                int.parse(mobilenumber.text),
                date.text,
                email.text,
                fatheroccpation.text,
                motheroccupation.text,
                int.parse(annualincome.text),
                address.text,
                int.parse(pincode.text),
                int.parse(admission.text),
                gender.text,
                fathername.text,
                mothername.text,
                int.parse(fatherphonenumber.text),
                int.parse(motherphonenumber.text),
              );
              Navigator.of(context).pop();
            },
            child: Text(
              "Submit",
              style: TextStyle(color: Colors.white),
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
              controller: name,
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
              controller: age,
              decoration: InputDecoration(
                filled: true,
                labelText: "Enter your age ",
                hintText: "eg.20",
                icon: Icon(FontAwesomeIcons.userFriends),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            TextFormField(
              controller: mobilenumber,
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
                controller: date,
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
                      date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                    });
                  }
                }),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            TextField(
              controller: email,
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
              controller: fathername,
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
              controller: mothername,
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
              controller: fatheroccpation,
              decoration: InputDecoration(
                filled: true,
                labelText: "Father Occupation",
                hintText: "Ocupation",
                icon: Icon(Icons.business_center_rounded),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            TextField(
              controller: motheroccupation,
              decoration: InputDecoration(
                filled: true,
                labelText: "Mother Occupation",
                hintText: "Ocupation",
                icon: Icon(Icons.business_center_rounded),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            TextField(
              controller: fatherphonenumber,
              decoration: InputDecoration(
                filled: true,
                labelText: "Father Phone Number",
                hintText: "Eg:9634567321",
                icon: Icon(Icons.phone_enabled_outlined),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            TextField(
              controller: motherphonenumber,
              decoration: InputDecoration(
                filled: true,
                labelText: "Mother Phone Number ",
                hintText: "Eg:9634567321",
                icon: Icon(Icons.business_center_rounded),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            TextField(
              controller: annualincome,
              decoration: InputDecoration(
                filled: true,
                labelText: "Family Annual Income",
                hintText: "100000/-",
                icon: Icon(Icons.monetization_on_sharp),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            TextField(
              controller: address,
              decoration: InputDecoration(
                filled: true,
                labelText: "Address",
                hintText: "address",
                icon: Icon(Icons.house),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            TextField(
              controller: pincode,
              decoration: InputDecoration(
                filled: true,
                labelText: "Pin Code",
                hintText: "eg:627003",
                icon: Icon(Icons.location_pin),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            TextField(
              controller: admission,
              decoration: InputDecoration(
                filled: true,
                labelText: "Admission for Class",
                hintText: "class",
                icon: Icon(Icons.location_pin),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            Column(
              children: [
                FormHelper.dropDownWidgetWithLabel(
                  context,
                  "Gender",
                  "Enter the gender",
                  this.countryId,
                  this.countries,
                  (onChangedVal) {
                    this.countryId = onChangedVal;
                  },
                  (onValidateVal) {
                    if (onValidateVal == null) {
                      return 'please Select gender';
                    }
                    vyy = onValidateVal;
                    return null;
                  },
                  prefixIcon: Icon(Icons.home),
                  borderColor: Theme.of(context).primaryColor,
                  borderFocusColor: Theme.of(context).primaryColor,
                  borderRadius: 15,
                  optionValue: "id",
                  optionLabel: "label",
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.application_name);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
