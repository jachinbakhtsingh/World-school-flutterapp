import 'dart:convert';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:myapp/home/home.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/staff_home_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../admin_home_page.dart';
import 'login_body_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  static bool isLogin = true;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    _readFromStorage();
    if (!Login.isLogin) {
      storage.delete(key: 'User_Name');
      storage.delete(key: 'Password');
      storage.delete(key: 'type');
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.clear();
    passController.clear();
  }

  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  TextEditingController loginTypeController = TextEditingController();
  final storage = const FlutterSecureStorage();

  void loading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  loadings() {
    return EasyLoading.show(status: 'loading...');
  }

  Future<void> _readFromStorage() async {
    emailController.text =
        Login.isLogin ? await storage.read(key: 'User_Name') ?? '' : '';
    passController.text =
        Login.isLogin ? await storage.read(key: 'Password') ?? '' : '';
    loginTypeController.text =
        Login.isLogin ? await storage.read(key: 'type') ?? '' : '';
    if (Login.isLogin) {
      login();
    }
  }

  void homeRoute(String routeName) {
    switch (routeName) {
      case 'student':
        Navigator.push(
            (context),
            MaterialPageRoute(
                builder: (context) => MyHomePage(loginData, homeJsonData)));
        break;

      case 'staff':
        Navigator.push(
            (context),
            MaterialPageRoute(
                builder: (context) =>
                    MyStaffHomePage(loginData, homeJsonData)));
        break;
      case 'admin':
        Navigator.push(
            (context),
            MaterialPageRoute(
                builder: (context) =>
                    MyAdminHomePage(loginData, homeJsonData)));
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BlurryModalProgressHUD(
          inAsyncCall: isLoading,
          blurEffectIntensity: 1,
          progressIndicator: const CircularProgressIndicator(
            backgroundColor: Colors.white,
            color: Colors.green,
          ),
          dismissible: false,
          opacity: 0.3,
          color: Colors.white,
          child: Scaffold(
              backgroundColor: const Color(0xff65F9CE),
              body: LoginBody(
                loginn: login,
                passController: passController,
                emailController: emailController,
              ))),
    );
  }

  static List<dynamic> loginData = [];

  static List<dynamic> homeJsonData = [];

  Future<void> login() async {
    loading();

    if (passController.text.isNotEmpty && emailController.text.isNotEmpty) {
      var response = await http.get(Uri.parse(
          "http://10.0.2.2:8090/api/login/${emailController.text}/${passController.text}"));
      loginData = jsonDecode(response.body);
      if (loginData.isEmpty) {
        loading();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Wrong Password")));
      } else if (loginData.isNotEmpty && response.statusCode == 200) {
        //to write in storage
        await storage.write(key: "User_Name", value: emailController.text);
        await storage.write(key: "Password", value: passController.text);

        print(response.statusCode);
        print(loginData);

        homeApi();
      } else {
        loading();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Credentials")));
      }
    } else {
      loading();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid Credentials")));
    }
  }

  Future<void> homeApi() async {
    if (loginData[0]["user_type"].toString() == "student".toString()) {
      var response2 = await http.get(Uri.parse(
          "http://10.0.2.2:8090/api/student/${loginData[0]["user_code"].toString()}"));
      homeJsonData = jsonDecode(response2.body);
      print(homeJsonData);
    } else if (loginData[0]["login_user_name"].toString().isNotEmpty &&
        loginData[0]["user_type"].toString() == "staff") {
      var response3 = await http.get(Uri.parse(
          "http://10.0.2.2:8090/api/staff/${loginData[0]["user_code"].toString()}"));
      print("staff status code ${response3.statusCode}");
      homeJsonData = jsonDecode(response3.body);
      print("staff data $homeJsonData");
    } else if (loginData[0]["login_user_name"].toString().isNotEmpty &&
        loginData[0]["user_type"].toString() == "admin") {
      var response3 = await http.get(Uri.parse(
          "http://10.0.2.2:8090/api/admin/${loginData[0]["user_code"].toString()}"));
      print("staff status code ${response3.statusCode}");
      homeJsonData = jsonDecode(response3.body);
      print("admin code $homeJsonData");
    } else {
      print("Failed to connect");
    }

    print(loginData);

    print(loginData[0]["login_user_name"]);

    if (homeJsonData.isNotEmpty) {
      Login.isLogin = true;

      if (loginData[0]["login_user_name"] == emailController.text &&
          loginData[0]["login_password"] == passController.text) {
        if (loginData[0]["user_type"].toString() == "student".toString()) {
          await storage.write(key: "type", value: 'student');
          homeRoute('student');
          loading();
        } else if (loginData[0]["user_type"].toString() == "staff") {
          await storage.write(key: "type", value: 'staff');
          homeRoute('staff');
          loading();
        } else if (loginData[0]["user_type"].toString() == "admin") {
          await storage.write(key: "type", value: 'staff');
          homeRoute('admin');
          loading();
        }
      }
    }
  }
}
