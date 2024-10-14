import 'package:flutter/material.dart';
import 'package:myapp/login/login.dart';

class Change_password extends StatefulWidget {
  const Change_password({Key? key}) : super(key: key);

  @override
  State<Change_password> createState() => _Change_passwordState();
}

class _Change_passwordState extends State<Change_password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Text('Enter your email'),
      backgroundColor: const Color(0xff65F9CE),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Center(
            child: SingleChildScrollView(
                child: Column(
          children: [
            SizedBox(height: 40),
            Icon(Icons.person, color: Colors.black, size: 140),
            SizedBox(height: 13),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextFormField(
                //   controller: emailController,
                decoration: InputDecoration(
                  // border: InputBorder.,
                  prefixIcon: Icon(Icons.lock_outline, size: 30),
                  labelText: "Create new password",
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.green[400],
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextFormField(
                //   controller: emailController,
                decoration: InputDecoration(
                  // border: InputBorder.,
                  prefixIcon: Icon(Icons.lock_outline, size: 30),
                  labelText: "Confirm password",
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
                  // loginn();
                  Navigator.push((context),
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text("Confirm"),
              ),
            ),
          ],
        ))),
      ),
    );
  }
}
