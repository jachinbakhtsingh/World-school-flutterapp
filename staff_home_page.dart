import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/Attendance/attendance_entry.dart';
import 'package:myapp/Enquiry_Report/enquiry_report.dart';
import 'package:myapp/student_exam_results.dart';
import 'package:myapp/Time_Table/timetable.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'Admin_Profile/admin_profile_view.dart';
import 'Apply_leave_od/tabbar_apply_leave.dart';
import 'Feedback/feedback.dart';
import 'courses.dart';
import 'exam_results.dart';
import 'notification.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/Student_profile/profile.dart';

import 'aboutus.dart';

import 'application_form.dart';
import 'constants.dart';
import 'login/login.dart';

class MyStaffHomePage extends StatefulWidget {
  MyStaffHomePage(this.loginData, this.homeData);

  final List<dynamic> homeData;
  final List<dynamic> loginData;

  @override
  State<MyStaffHomePage> createState() => _MyStaffHomePageState();
}

class _MyStaffHomePageState extends State<MyStaffHomePage> {
  @override
  void onSelected(BuildContext Context, int item) {
    switch (item) {
      case 0:
        // Navigator.push(
        //     Context, MaterialPageRoute(builder: (context) => Profile()));
        break;
      case 1:
        _onBackButtonPressed(context);
        break;
    }
    ;
  }

  void attendaceNavigator() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => attendance()));
  }

  void examResults() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ExamResult()));
  }

  void ApplyLeave() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TabbarApplylLeave()));
  }

  @override
  Widget build(BuildContext context) {
    // Relod();
    print("home page ${widget.loginData[0]["login_user_name"]}");
    print("home page data ${widget.homeData[0]["staff_name"]}");
    // HomeConnections();
    //  print(HomejsonData[0]["student_name"]);
    return Scaffold(
        // backgroundColor: const Color(0xff10FAB6),

        appBar: AppBar(
          title: Text("Dashboard"),
          backgroundColor: const Color(0xff03A375),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => notifications()));
                  },
                  child: Icon(Icons.notifications),
                )),
            PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (itemBuilder) => [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text('Profile'),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: const Text('Log Out'),
                  onTap: () {
                    Login.isLogin = false;
                  },
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(kDefaultPadding * 2),
                    bottomLeft: Radius.circular(kDefaultPadding * 2),
                  )),
              //color: kSecondaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Hi ',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(fontWeight: FontWeight.w200),
                              ),
                              Text(
                                widget.homeData[0]["staff_name"],
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          Text(
                            " Staff code : ${widget.homeData[0]["staff_code"]}",
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      fontSize: 14.0,
                                    ),
                          ),
                          SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          Container(
                            width: 100,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.circular(kDefaultPadding),
                            ),
                            child: Center(
                              child: Text(
                                widget.homeData[0]["staff_experience"],
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: kTextBlackColor,
                                    fontWeight: FontWeight.w200),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: kDefaultPadding / 6,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          minRadius: 50.0,
                          maxRadius: 50.0,
                          backgroundColor: kSecondaryColor,
                          backgroundImage: AssetImage("images/1.png"),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: MediaQuery.of(context).size.height / 5.5,
                              //color: Colors.white,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 13.0,
                                animation: true,
                                percent: 0.7,
                                center: Text(
                                  "1900/2000",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                                footer: Text(
                                  "Student Presents",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Color(0xff03A375),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: MediaQuery.of(context).size.height / 5.5,
                              //color: Colors.white,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 13.0,
                                animation: true,
                                percent: 0.9,
                                center: Text(
                                  "190/200",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                                footer: Text(
                                  "Staff Presents",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Color(0xff03A375),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kDefaultPadding * 3),
                      topRight: Radius.circular(kDefaultPadding * 3),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Homecard(
                            onPress: attendaceNavigator,
                            icon: 'images/attendance.png',
                            title: 'Attendance',
                          ),
                          Homecard(
                            onPress: examResults,
                            icon: 'images/examresults.jpg',
                            title: 'Exam Results',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Homecard(
                            onPress: ApplyLeave,
                            icon: 'images/applyleave.png',
                            title: 'Apply Leave ',
                          ),
                          Homecard(
                            onPress: () {},
                            icon: 'images/1.png',
                            title: 'hii',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),

        //  body: const Center(),
        drawer: Drawer(
            elevation: 50.0,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: const Color(0xff03A375),
                  ),

                  //child: Text("Profile"),
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: 130,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.account_circle_rounded),
                  title: const Text(
                    'Attendance Entry',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  //  Icons.account_circle,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => attendance()));
                  },
                ),
                Divider(
                  height: 2.0,
                  indent: 15.0,
                  endIndent: 15.0,
                  thickness: 1.5,
                ),
                ListTile(
                  leading: const Icon(Icons.account_circle_sharp),
                  title: const Text(
                    'Apply leave & OD',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TabbarApplylLeave()));
                  },
                ),
                Divider(
                  height: 2.0,
                  indent: 15.0,
                  endIndent: 15.0,
                  thickness: 1.5,
                ),
                ListTile(
                  leading: const Icon(Icons.ad_units),
                  title: const Text(
                    'Exam  Results',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  //  Icons.account_circle,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ExamResult()));
                  },
                ),
                Divider(
                  height: 2.0,
                  indent: 15.0,
                  endIndent: 15.0,
                  thickness: 1.5,
                ),
                ListTile(
                  leading: const Icon(Icons.ad_units),
                  title: const Text(
                    'Feedback',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  //  Icons.account_circle,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FeedBack(
                                  homeData: widget.homeData,
                                  loginData: widget.loginData,
                                )));
                  },
                ),
                Divider(
                  height: 2.0,
                  indent: 15.0,
                  endIndent: 15.0,
                  thickness: 1.5,
                ),
                ListTile(
                  leading: const Icon(Icons.account_circle_outlined),
                  title: const Text(
                    'Application Form',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  //  Icons.account_circle,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Application_form()));
                  },
                ),
                Divider(
                  height: 2.0,
                  indent: 15.0,
                  endIndent: 15.0,
                  thickness: 1.5,
                ),
                ListTile(
                  leading: const Icon(Icons.account_balance_sharp),
                  title: const Text(
                    'Enquiry Report',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Enquiry_Report()));
                  },
                ),
                Divider(
                  height: 2.0,
                  indent: 15.0,
                  endIndent: 15.0,
                  thickness: 1.5,
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text(
                    'About Us',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => aboutus()));
                  },
                ),
                Divider(
                  height: 2.0,
                  indent: 15.0,
                  endIndent: 15.0,
                  thickness: 1.5,
                ),
              ],
            )));
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Really ??"),
            content: const Text("Are You Sure"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('no'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                  // Navigator.of(context).pop(true);
                },
                child: const Text('yes'),
              ),
            ],
          );
        });
    return exitApp ? false : true;
  }
}

class Homecard extends StatelessWidget {
  const Homecard(
      {Key? key,
      required this.onPress,
      required this.title,
      required this.icon})
      : super(key: key);
  final VoidCallback onPress;

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: kDefaultPadding / 2),
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.height / 9,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(kDefaultPadding / 2),
            ),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 9,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        icon,
                        fit: BoxFit.cover,
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
