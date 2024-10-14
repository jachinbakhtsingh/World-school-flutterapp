import 'package:flutter/material.dart';

import 'constants.dart';

class aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("About us"),
        backgroundColor: const Color(0xff03A375),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: kOtherColor,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    //color: kPrimaryColor,
                    color: const Color(0xFFC8E6C9),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(kDefaultPadding * 4),
                      bottomLeft: Radius.circular(kDefaultPadding * 4),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: 100.0,
                      minRadius: 10.0,
                      backgroundImage: AssetImage('images/1.png'),
                    ),
                  ],
                ),
              ),
              kWidthSizedBox,
              ProfileDetailColum(
                title: 'FXCAMS',
                value: 'V2.2.2',
              ),
              ProfileDetailColum(
                title: 'FXCAMS',
                value: 'V2.2.2',
              ),
              ProfileDetailColum(
                title: 'Mail',
                value: 'contact@fxcams.in',
              ),
              ProfileDetailColum(
                title: 'For more, Visit',
                value: 'fxcams.in',
              ),
              ProfileDetailColum(
                title: 'Privacy Policy',
                value: '',
              ),
            ],
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
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: kTextLightColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 20.0,
                    ),
              ),
              kHalfSizedBox,
              Text(
                value,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: kTextBlackColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 18.0,
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
