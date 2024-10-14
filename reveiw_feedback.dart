import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Feedback/reply_feedback.dart';

class Reveiw_FeddBack extends StatefulWidget {
  const Reveiw_FeddBack({super.key,
    required this.homeData,
    required this.jsonfeedbackReview,
  });
  final List<dynamic> jsonfeedbackReview;
  final List<dynamic> homeData;

  @override
  State<Reveiw_FeddBack> createState() => _Reveiw_FeddBackState();
}

class _Reveiw_FeddBackState extends State<Reveiw_FeddBack> {
  @override
  Widget build(BuildContext context) {
    //print('REview ${widget.jsonfeedbackReview[0]}');
    print(widget.homeData);

    List<dynamic> rows = widget.jsonfeedbackReview.map((e) {
      if (e['feedback_reply'] == null) {
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    Report_Review(jsonfeedbackReview: e)));
          },
          child: Column(
            children: <Widget>[
              Container(
                height: 45,
                width: double.infinity,
                //: 60,
                margin: EdgeInsets.all(8),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.green,
                        backgroundImage: AssetImage("images/pikkachu.jpg"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${e['feedback_sender']}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            '${e['feedback_content']}',
                            style:
                            TextStyle(color: Colors.grey, fontSize: 11),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Text(
                      '${e['created_on_time']}',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
              )
            ],
          ),
        );
      }
      return null;
    } ).toList();

    rows.removeWhere((element) {
      return element == null;
    });

    print(rows);
    //print(widget.jsonfeedbackReview.length);
    print(widget.jsonfeedbackReview);
    return Scaffold(
      body: rows.length >0?ListView.builder(itemBuilder: (context,index){
        return rows[index];
      },
      itemCount: rows.length,

      ):Center(child: Text("no data found")),
    );
  }
}
