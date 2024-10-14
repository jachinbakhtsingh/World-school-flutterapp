import 'package:flutter/material.dart';
import 'package:myapp/Admin_Profile/staff_profile.dart';

class admin_Staff extends StatefulWidget {
  const admin_Staff({Key? key}) : super(key: key);

  @override
  State<admin_Staff> createState() => _admin_StaffState();
}

class _admin_StaffState extends State<admin_Staff> {
  List detailsName = [
    'Esakki',
    'Mothilal',
    'Samuel',
    'Rahul',
  ];
  List detailsId = ['6768681', '234254', '432424', '534434'];
  List detailsImage = [
    'images/pikkachu.jpg',
    'images/pikkachu.jpg',
    'images/pikkachu.jpg',
    'images/pikkachu.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey,
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
                for (int i = 0; i < detailsId.length; i++)
                  _buildCard('Esakki', '6768681', 'images/pikkachu.jpg'),
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
          Navigator.push((context),
              MaterialPageRoute(builder: (context) => Profile_staff()));
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
