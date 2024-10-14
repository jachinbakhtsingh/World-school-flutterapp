import 'package:flutter/material.dart';

import '../Forgot_Password/get_otp.dart';

class LoginBody extends StatelessWidget {
  const LoginBody(
      {Key? key,
      required this.emailController,
      required this.passController,
      required this.loginn})
      : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passController;
  final Function loginn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Center(
          child: SingleChildScrollView(
              child: Column(
        children: [
          const SizedBox(height: 40),
          const Icon(Icons.school, color: Colors.black, size: 140),
          const SizedBox(height: 13),
          const Text(
            "Welcome Back",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "sign in to continue",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (input) => !input.toString().contains("@")
                  ? "Email id should be valid"
                  : null,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              decoration: InputDecoration(
                // border: InputBorder.,
                prefixIcon: const Icon(Icons.person_outlined, size: 30),
                labelText: "USER NAME",
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.green[400],
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextFormField(
              controller: passController,
              keyboardType: TextInputType.text,
              validator: (input) => input.toString().length < 3
                  ? "Email id should be valid"
                  : null,
              obscureText: true,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              decoration: InputDecoration(
                  // border: InputBorder.none,
                  prefixIcon: const Icon(Icons.lock, size: 30),
                  labelText: "PASSWORD",
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.green[400],
                    fontWeight: FontWeight.w800,
                  )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push((context),
                      MaterialPageRoute(builder: (context) => const Get_Otp()));
                },
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 55,
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  loginn();
                  // emailController.clear();a
                  // passController.clear();
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ))),
    );
  }
}
