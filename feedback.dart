import 'dart:convert';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/Feedback/report_feedback.dart';
import 'package:myapp/Feedback/reveiw_feedback.dart';
import 'package:http/http.dart' as http;

import 'history_feedback.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key, required, required this.homeData, this.loginData})
      : super(key: key);

  final List<dynamic> homeData;
  final loginData;

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this, initialIndex: 0);
    FeedbackDetailsHistory();
    fedbackReview();
  }

  @override
  void dispose() {
    super.dispose();

    isLoadingState();
  }

  var jsonfeedback;
  var jsonHistoryFeedback;
  var jsonReview;
  bool isLoading = true;

  Future<void> FeedbackDetailsHistory() async {
    print("api calls");
    var response;
    if(widget.loginData[0]['user_type'] == 'student' || widget.loginData[0]['user_type'] == 'staff' ) {
       response = await http.get(Uri.parse(
          "http://10.0.2.2:8090/api/feedbackrecieve/${widget
              .homeData[0]['register_number']}"));
    }else{
      response = await http.get(Uri.parse(
          "http://10.0.2.2:8090/api/feedbackrecieve/${widget
              .homeData[0]['admin_code']}"));
    }
    print(" feedback ${response.statusCode}");
    jsonHistoryFeedback = jsonDecode(response.body);
    print(jsonHistoryFeedback);
    print(widget.homeData[0]['register_number']);
    isLoadingState();
  }

  Future<void> fedbackReview() async {
    print("review api");
    var response = await http
        .get(Uri.parse("http://10.0.2.2:8090/api/reviewfeedbackrecieve/${widget.homeData[0]['admin_code']}"));
    print(response.statusCode);
    jsonReview = jsonDecode(response.body);
    print("review data ${jsonReview[0]}");

  }

  void isLoadingState() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {


    print('g');
    print(widget.homeData[0]['admin_code']);

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.green));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03A375),
        title: Text("FeedBack"),
        actions: [
          widget.loginData[0]['user_type'] != 'admin'?InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      Feedback_Overview(homeData: widget.homeData)));
            },
            child: Row(
              children: [
                const Icon(Icons.report_gmailerrorred),
                Container(
                    margin: const EdgeInsets.all(3),
                    child: const Text(
                      "Report",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ):SizedBox(),
          //IconButton(onPressed: () {}, icon: Icon(Icons.report_gmailerrorred))
        ],
        bottom: TabBar(
          indicator: UnderlineTabIndicator(
              insets: EdgeInsets.symmetric(horizontal: 16.0)),
          controller: controller,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          tabs: [
            const Tab(
              child: Text(
                "History",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            widget.loginData[0]['user_type'] == 'staff' || widget.loginData[0]['user_type'] == 'student'
                ? const SizedBox()
                :  const Tab(
              child: Text(
                "Review FeedBack",
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          BlurryModalProgressHUD(
            inAsyncCall: isLoading,
            blurEffectIntensity: 1,
            progressIndicator: const CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: Colors.green,
            ),
            dismissible: false,
            opacity: 0.3,
            color: Colors.white,
            child: History_Feedback(
              homeData: widget.homeData,
              historyData: jsonHistoryFeedback,
            ),
          ),
          widget.loginData[0]['user_type'] == 'staff' || widget.loginData[0]['user_type'] == 'student'? const SizedBox()
          : Reveiw_FeddBack(
              homeData: widget.homeData, jsonfeedbackReview: jsonReview)
        ],
      ),
    );
  }
}
