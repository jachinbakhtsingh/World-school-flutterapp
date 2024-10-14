import 'dart:convert';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Feedback/history_message.dart';
import 'package:http/http.dart' as http;

class History_Feedback extends StatefulWidget {
  const History_Feedback({
    Key? key,
    required this.homeData,
    required this.historyData,
  }) : super(key: key);

  final List<dynamic> homeData;
  final List<dynamic> historyData;

  @override
  State<History_Feedback> createState() => _History_FeedbackState();
}

late String staffName;

class _History_FeedbackState extends State<History_Feedback> {
  @override
  void initStates() {
    super.initState();
    print('initState');
  }

  String staffNameSwitch(String staffId) {
    switch (staffId) {
      case '2015034':
        staffName = ' jesh R';
        break;
      case '2015004':
        staffName = 'VELMURUGAN V';
        break;
    }
    return staffName;
  }


  @override
  Widget build(BuildContext context) {
    print("history");
    print(widget.historyData);
    return Container(
        child: widget.historyData != null
            ? ListView.builder(
                itemCount: widget.historyData.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Messages(
                                    data: widget.historyData[index],
                                  )));
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 45,
                          width: double.infinity,
                          //: 60,
                          margin: const EdgeInsets.all(8),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.green,
                                  backgroundImage:
                                      AssetImage("images/pikkachu.jpg"),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      staffNameSwitch(widget.historyData[index]
                                          ['feedback_reciever']),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    const Text(
                                      "Message Description",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 150,
                              ),
                              Text(
                                "9:30 AM",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                        )
                      ],
                    ),
                  );
                })
            : Center(
                child: Text(
                  "no history found!",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ));
  }
}
