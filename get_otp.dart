import 'package:flutter/material.dart';
import 'package:myapp/Forgot_Password/change_password.dart';

class Get_Otp extends StatefulWidget {
  const Get_Otp({Key? key}) : super(key: key);

  @override
  State<Get_Otp> createState() => _Get_OtpState();
}

class _Get_OtpState extends State<Get_Otp> {
  String button = "Get OTP";
  String textfield = "Enter Your Email";

  void onChanged() {
    setState(() {
      if (button == "Get OTP") {
        button = "Submit";
        textfield = "Enter Your Otp";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return button == "Submit"
        ? Scaffold(
            // body: Text('Enter your email'),
            backgroundColor: const Color(0xff65F9CE),
            body: Padding(
              padding: EdgeInsets.all(25),
              child: Center(
                  child: SingleChildScrollView(
                      child: Column(
                children: [
                  SizedBox(height: 40),
                  Icon(Icons.school, color: Colors.black, size: 140),
                  SizedBox(height: 13),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextFormField(
                      //   controller: emailController,
                      decoration: InputDecoration(
                        // border: InputBorder.,
                        prefixIcon: Icon(Icons.numbers, size: 30),
                        labelText: "$textfield",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.green[400],
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        textStyle: TextStyle(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => Change_password()));
                      },
                      child: Text("$button"),
                    ),
                  ),
                ],
              ))),
            ),
          )
        : Scaffold(
            // body: Text('Enter your email'),
            backgroundColor: const Color(0xff65F9CE),
            body: Padding(
              padding: EdgeInsets.all(25),
              child: Center(
                  child: SingleChildScrollView(
                      child: Column(
                children: [
                  SizedBox(height: 40),
                  Icon(Icons.school, color: Colors.black, size: 140),
                  SizedBox(height: 13),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextFormField(
                      //   controller: emailController,
                      decoration: InputDecoration(
                        // border: InputBorder.,
                        prefixIcon: Icon(Icons.mail, size: 30),
                        labelText: "$textfield",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.green[400],
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        textStyle: TextStyle(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        onChanged();
                      },
                      child: Text("$button"),
                    ),
                  ),
                ],
              ))),
            ),
          );
  }
}
