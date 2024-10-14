import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Drawer/drawer.dart';
import '../notification.dart';
import 'package:myapp/Student_profile/profile.dart';

import '../constants.dart';
import '../login/login.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage(this.loginData, this.homeData);

  final homeData;
  final List<dynamic> loginData;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void onSelected(BuildContext Context, int item) {
    switch (item) {
      case 0:
        Navigator.push(
            Context,
            MaterialPageRoute(
                builder: (context) => Profile(homeData: widget.homeData)));
        break;
      case 1:
        _onBackButtonPressed(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Relod();
    print("home page ${widget.loginData[0]["login_user_name"]}");
    print("home page data ${widget.homeData[0]["student_name"]}");
    // HomeConnections();
    //  print(HomejsonData[0]["student_name"]);
    return Scaffold(
        // backgroundColor: const Color(0xff10FAB6),
        //backgroundColor: Colors.blue.shade600,
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
                PopupMenuItem<int>(
                  value: 0,
                  child: Text('Profile'),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text('Log Out'),
                  onTap: () {
                    Login.isLogin = false;
                  },
                ),
              ],
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                padding: EdgeInsets.all(kDefaultPadding),
                //color: kSecondaryColor,
                decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(kDefaultPadding * 2),
                      bottomLeft: Radius.circular(kDefaultPadding * 2),
                    )),
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
                                  widget.homeData[0]["student_name"],
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
                              "Class ${widget.homeData[0]["class"]} ${widget.homeData[0]["section"]} | Roll no : ${widget.homeData[0]["roll_number"]}",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
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
                                  '2020 - 2021',
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
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: MediaQuery.of(context).size.height / 9,
                            decoration: BoxDecoration(
                              color: kOtherColor,
                              borderRadius:
                                  BorderRadius.circular(kDefaultPadding),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Attendance",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          fontSize: 16.0,
                                          color: kTextBlackColor,
                                          fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  "90.02 %",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                          fontSize: 25.0,
                                          color: kTextBlackColor,
                                          fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: MediaQuery.of(context).size.height / 9,
                            decoration: BoxDecoration(
                              color: kOtherColor,
                              borderRadius:
                                  BorderRadius.circular(kDefaultPadding),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Fees Due",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          fontSize: 16.0,
                                          color: kTextBlackColor,
                                          fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  "10,000",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                          fontSize: 25.0,
                                          color: kTextBlackColor,
                                          fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
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
                              onPress: () {},
                              icon: 'images/1.png',
                              title: 'hai',
                            ),
                            Homecard(
                              onPress: () {},
                              icon: 'images/1.png',
                              title: 'hii',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Homecard(
                              onPress: () {},
                              icon: 'images/1.png',
                              title: 'hai',
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
        ),

        //  body: const Center(),
        drawer: Drawers(
          homeData: widget.homeData,
          loginData: widget.loginData,
        ));
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
      required this.icon,
      required this.title})
      : super(key: key);
  final VoidCallback onPress;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding / 2),
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.height / 9,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: 40.0,
              width: 40.0,
              color: kOtherColor,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            SizedBox(
              height: kDefaultPadding / 3,
            )
          ],
        ),
      ),
    );
  }
}
