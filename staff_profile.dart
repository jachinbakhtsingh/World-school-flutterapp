import 'package:flutter/material.dart';

import '../constants.dart';

class Profile_staff extends StatelessWidget {
  const Profile_staff({Key? key}) : super(key: key);

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
          title: Text('Staff Profile'),
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
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dr.S.Samuel',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    fontSize: 20.0,
                                    color: Colors.brown,
                                    fontWeight: FontWeight.w800),
                          ),
                          Text(
                            'Assistant Professor',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    fontSize: 14.0,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.w800),
                          ),
                          Text('Department of IT',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                      fontSize: 14.0,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.w800)),
                          Text('Francis Xavier Engineering College',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                      fontSize: 14.0,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.w800)),
                        ],
                      )
                    ],
                  ),
                ),
                sizedBox,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileDetailRow(title: 'Staff ID', value: '95072015003'),
                      ProfileDetailRow(
                          title: 'Work experience', value: '7 years'),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileDetailRow(
                          title: 'Subject Handling',
                          value: 'English Literature'),
                      ProfileDetailRow(
                          title: 'Date of hire', value: '17/6/2015'),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileDetailRow(
                          title: 'Date of Birth', value: '1 Aug, 1989'),
                      ProfileDetailRow(title: 'Staff Status', value: 'Active'),
                    ]),
                ProfileDetailColum(
                  title: 'Email',
                  value: 'samuel@gmail.com',
                ),
                ProfileDetailColum(
                  title: 'Phone Number',
                  value: '97873434143',
                ),
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
