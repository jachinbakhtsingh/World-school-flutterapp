import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/constants.dart';
import 'Feedback/feedback.dart';
import 'auth.dart';
import 'login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          //scaffoldBackgroundColor: Color(0xFFE4E6E5),
          backgroundColor: Color(0xFFE4E6E5),
          primaryColor: kPrimaryColor,
          textTheme:
              GoogleFonts.sourceSansProTextTheme(Theme.of(context).textTheme)
                  .apply()
                  .copyWith(
                    bodyText1: TextStyle(
                        color: kTextWhiteColor,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold),
                  )),
      home: const Auth(),
      builder: EasyLoading.init(),
    );
  }
}
