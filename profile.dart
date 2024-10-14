import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/Student_profile/profile_reports.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key, required this.homeData}) : super(key: key);

  final List<dynamic> homeData;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print(
            'Backbutton pressed (device or appbar button), do whatever you want.');
        //trigger leaving and use own data
        Navigator.pop(context);
        //we need to return a future
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff03A375),
          title: Text('My Profile'),
          actions: [
            InkWell(
              onTap: () {
                //send report to scholl management
              },
              child: Container(
                padding: EdgeInsets.only(right: kDefaultPadding / 2),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile_Reports()));
                      },
                      tooltip: "Report",
                      icon: Icon(Icons.report_gmailerrorred_outlined),
                    ),
                    kHalfWidthSizedBox,
                  ],
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: kOtherColor,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      //color: kPrimaryColor,
                      color: const Color(0xFFC8E6C9),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(kDefaultPadding * 2),
                        bottomLeft: Radius.circular(kDefaultPadding * 2),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        maxRadius: 50.0,
                        minRadius: 50.0,
                        backgroundColor: kSecondaryColor,
                        backgroundImage: AssetImage('images/pikkachu.jpg'),
                      ),
                      kWidthSizedBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            homeData[0]["student_name"],
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            'class ${homeData[0]["class"]} ${homeData[0]["section"]} | Roll no:${homeData[0]["roll_number"]}',
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      fontSize: 14.0,
                                    ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                sizedBox,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileDetailRow(
                          title: 'Register Number',
                          value: '${homeData[0]["roll_number"]}'),
                      ProfileDetailRow(
                          title: 'Academic Year', value: '2020-2021'),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileDetailRow(
                          title: 'Admission class',
                          value: '${homeData[0]["class"]}'),
                      ProfileDetailRow(
                          title: 'Admission Number', value: '012642'),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileDetailRow(
                          title: 'Date of Birth',
                          value: '${homeData[0]["date_of_birth"]}'),
                      ProfileDetailRow(title: 'Marks', value: '60%'),
                    ]),
                ProfileDetailColum(
                  title: 'Email',
                  value: '${homeData[0]["student_email_id"]}',
                ),
                ProfileDetailColum(
                  title: 'Father name',
                  value: '${homeData[0]["student_father_name"]}',
                ),
                ProfileDetailColum(
                  title: 'Mother name',
                  value: '${homeData[0]["student_father_name"]}',
                ),
                ProfileDetailColum(
                  title: 'Phone Number',
                  value: '${homeData[0]["student_phone_number"]}',
                ),
                //ProfileDetailColum(title: 'Email',value: 'jesh@gmail.com',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          right: kDefaultPadding / 4,
          left: kDefaultPadding / 4,
          top: kDefaultPadding / 2),
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: kTextLightColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                    ),
              ),
              kHalfSizedBox,
              Text(
                value,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: kTextBlackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                    ),
              ),
              kHalfSizedBox,
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: Divider(
                  thickness: 1.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileDetailColum extends StatelessWidget {
  const ProfileDetailColum({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: kTextLightColor,
                        fontSize: 15.0,
                      )),
              kHalfSizedBox,
              Text(value,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: kTextBlackColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      )),
              kHalfSizedBox,
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Divider(
                  thickness: 1.0,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
