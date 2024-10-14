import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/Feedback/feedback.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../Api_Calls/feedback/feedback_report_api.dart';

class Feedback_Overview extends StatefulWidget {
  const Feedback_Overview({Key? key, required this.homeData}) : super(key: key);

  final List<dynamic> homeData;

  @override
  State<Feedback_Overview> createState() => _Feedback_OverviewState();
}

class _Feedback_OverviewState extends State<Feedback_Overview> {
  List<dynamic> categories = [];
  String? categoriesId;
  String? categoriesval;
  List<dynamic> to = [];
  String? toId;
  String? toval;
  TextEditingController content = TextEditingController();
  Future<Feeddback>? futureFeedback;
  @override
  void initState() {
    super.initState();
    this.categories.add({"id": 1, "label": "Academic"});
    this.categories.add({"id": 2, "label": "Infrastructure"});
    this.categories.add({"id": 3, "label": "Hostel"});
    this.categories.add({"id": 4, "label": "General"});
    this.categories.add({"id": 5, "label": "ERP"});
    {}

    super.initState();
    this.to.add({"id1": 6, "label1": "MANAGING DIRECTOR - ARUNBABU C"});
    this.to.add({"id1": 7, "label1": "PRINCIPAL - VELMURUGAN V"});
    this.to.add({"id1": 8, "label1": "PROF ACADEMIC - PRIYA L R"});
    this.to.add({"id1": 9, "label1": "CAMPUS MANAGER - ZAHARIYA GABRIEL J"});
    this.to.add({"id1": 10, "label1": "PROF - CAROLINE VIOLA STELLA MARY M"});
  }

  Widget build(BuildContext context) {
    void toSwitch(var val) {
      setState(() {
        switch (val) {
          case '6':
            {
              toval = '2015034';
            }
            break;
          case '7':
            {
              toval = '2015034';
            }
            break;
          case '8':
            {
              toval = '2015034';
            }
            break;
          case '9':
            {
              toval = '2015034';
            }
            break;
        }
      });
    }

    void categoriesSwitch(var vals) {
      setState(() {
        switch (vals) {
          case '1':
            {
              categoriesval = 'Academic';
            }
            break;
          case '2':
            {
              categoriesval = 'Infrastructure';
            }
            break;
          case '3':
            {
              categoriesval = 'Hostel ';
            }
            break;
          case '4':
            {
              categoriesval = 'General';
            }
            break;
          case '5':
            {
              categoriesval = 'ERP';
            }
            break;
        }
      });
    }
    //print("overview data ${widget.homeData[0]['register_number']}");

    String sender = widget.homeData[0]['register_number'];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Report"),
        backgroundColor: const Color(0xff03A375),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                FormHelper.dropDownWidgetWithLabel(
                  context,
                  "Category",
                  "ERP",
                  categoriesId,
                  categories,
                  (onChangedVal) {
                    categoriesId = onChangedVal;
                    categoriesSwitch(categoriesId);
                  },
                  (onValidateVal) {
                    if (onValidateVal == null) {
                      return 'ERP';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.home),
                  borderColor: Theme.of(context).primaryColor,
                  borderFocusColor: Theme.of(context).primaryColor,
                  borderRadius: 15,
                  optionValue: "id",
                  optionLabel: "label",
                ),
                FormHelper.dropDownWidgetWithLabel(
                  context,
                  "To",
                  "Professor",
                  this.toId,
                  this.to,
                  (onChangedVal) {
                    this.toId = onChangedVal;
                    toSwitch(this.toId);
                  },
                  (onValidateVal) {
                    if (onValidateVal == null) {
                      return 'Professor';
                    }
                    return null;
                  },
                  prefixIcon: Icon(Icons.home),
                  borderColor: Theme.of(context).primaryColor,
                  borderFocusColor: Theme.of(context).primaryColor,
                  borderRadius: 15,
                  optionValue: "id1",
                  optionLabel: "label1",
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text('Feedback',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: buildFeedbackForm(),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff03A375), // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      futureFeedback = createFeedback(
                          feedback_id: int.parse(
                              DateTime.now().microsecondsSinceEpoch.toString()),
                          feedback_sender: sender.toString(),
                          feedback_reciever: toval.toString(),
                          feedback_content: content.text,
                          created_on_date: DateFormat("yyyy-MM-dd")
                              .format(DateTime.now())
                              .toString(),
                          created_on_time: DateFormat("HH:mm:ss")
                              .format(DateTime.now())
                              .toString(),
                          feedback_category: categoriesval.toString());
                      print(futureFeedback!);
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.send)),
              ],
            )
          ],
        ),
      ),
    );
  }

  buildFeedbackForm() {
    return SizedBox(
        height: 100.0,
        child: Stack(
          children: <Widget>[
            TextField(
              controller: content,
              maxLines: 10,
              decoration: InputDecoration(
                  hintText: "please briefly describe the issue",
                  hintStyle: TextStyle(fontSize: 13.0, color: Colors.black38),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
            )
          ],
        ));
  }
}
