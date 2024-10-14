import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03A375),
        title: Text("Gender Wise Report"),
      ),
      body: Container(
        child: ListOfClass(),
      ),
    );
  }
}

class ListOfClass extends StatefulWidget {
  const ListOfClass({Key? key}) : super(key: key);

  @override
  State<ListOfClass> createState() => _ListOfClassState();
}

class _ListOfClassState extends State<ListOfClass> {
  List name = [
    "1st STD",
    "2nd STD",
    "3rd STD",
    "4th STD",
    "5th STD",
    "6th STD",
    "7th STD",
    "8th STD",
    "9th STD",
    "10th STD",
    "11th STD",
    "12th STD"
  ];
  List male = [
    "11",
    "21",
    "35",
    "47",
    "56",
    "62",
    "71",
    "81",
    "92",
    "10",
    "11",
    "12"
  ];
  List female = [
    "11",
    "21",
    "35",
    "47",
    "56",
    "62",
    "71",
    "81",
    "92",
    "10",
    "11",
    "12"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC8E6C9),
      body: Container(
        child: ListView.builder(
          itemCount: 12,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => Container(
            width: MediaQuery.of(context).size.width,
            child: Container(
              width: double.infinity,
              child: Card(
                elevation: 2.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 6.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                name[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      VerticalDivider(
                        width: 13,
                        thickness: 3,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // alignment: Alignment.center,
                          Text(
                            "Male",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Text(
                            male[index],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      VerticalDivider(
                        width: 3,
                        thickness: 3,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // alignment: Alignment.center,
                          Text(
                            "Female",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Text(
                            female[index],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
