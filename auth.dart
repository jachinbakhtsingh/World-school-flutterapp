import 'package:flutter/material.dart';
import 'package:myapp/home/home.dart';

import 'login/login.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return const Login();
  }
}
