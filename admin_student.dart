import 'package:flutter/material.dart';
import 'package:myapp/Attendance/student_list.dart';

import '../Student_profile/profile.dart';

class admin_student extends StatefulWidget {
  const admin_student({Key? key}) : super(key: key);

  @override
  State<admin_student> createState() => _admin_studentState();
}

class _admin_studentState extends State<admin_student> {
  List studetailsName = [
    'Esakki',
    'Mothilal',
    'Samuel',
    'Rahul',
  ];
  List studetailsId = ['6768681', '234254', '432424', '534434'];
  List studetailsImage = [
    'images/pikkachu.jpg',
    'images/pikkachu.jpg',
    'images/pikkachu.jpg',
    'images/pikkachu.jpg',
  ];
  void updateList(String value) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      //  color: Colors.grey,
      child: ListView(
        children: <Widget>[
          Container(
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
          SizedBox(
            height: 2.0,
          ),
          Container(
            padding: EdgeInsets.all(15),

            // width: MediaQuery.of(context).size.width - 30,
            height: 900, //MediaQuery.of(context).size.width - 30.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: true,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 1.0,
              children: <Widget>[
                for (int i = 0; i < studetailsId.length; i++)
                  _buildCard(
                      studetailsName[i], studetailsId[i], studetailsImage[i]),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath) {
    return Container(
      //height: 50,
      //padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //     (context), MaterialPageRoute(builder: (context) => Profile()));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 10.0,
                  blurRadius: 15.0,
                )
              ],
              color: Colors.white54),
          child: Column(
            children: [
              Hero(
                tag: imgPath,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(imgPath),
                          maxRadius: 60,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(price,
                  style: TextStyle(color: Colors.black, fontSize: 14.0)),
            ],
          ),
        ),
      ),
    );
  }
}
