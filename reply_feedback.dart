import 'dart:convert';
import  'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Report_Review extends StatefulWidget {
  const Report_Review({Key? key, required this.jsonfeedbackReview}) : super(key: key);

  final  jsonfeedbackReview;
  @override
  State<Report_Review> createState() => _Report_ReviewState();
}

class _Report_ReviewState extends State<Report_Review> {
  TextEditingController mesage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("reply page");
    print(widget.jsonfeedbackReview[0]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03A375),
        title: Text("Review"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.all(3),
                color: const Color(0xFFC8E6C9),
                child: Text(
                  "${widget.jsonfeedbackReview['feedback_category']}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
            Container(
                margin: const EdgeInsets.all(10),
                height: 50,
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 0.1),
                        left: BorderSide(width: 0.5),
                        right: BorderSide(width: 0.5),
                        bottom: BorderSide(width: 0.1))),
                // color: Colors.grey,
                width: double.infinity,
                child: Text(" ${widget.jsonfeedbackReview['feedback_content']}")),
            const Text("Reply :"),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 150,
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 0.5),
                      left: BorderSide(width: 0.5),
                      right: BorderSide(width: 0.5),
                      bottom: BorderSide(width: 0.3))),
              // color: Colors.grey,
              width: double.infinity,
              child: TextField(
                // minLines: 1,
                onChanged: (val){
                  setState(() {
                    mesage.text = val.toString();
                  });
                },
                maxLines: 10,
                decoration:
                    const InputDecoration(hintText: "Please enter the message"),
              ),
            ),
            const SizedBox(
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
                      createAlbum(mesage.text,DateFormat("hh:mm:ss a").format(DateTime.now()),DateTime.now().toString(),widget.jsonfeedbackReview['feedback_id']);
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.send)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void createAlbum(
 String feedback_reply,
 String replied_on_time,
 String replied_on_date,
 String feedback_id,) async {
  print("object");
  print(replied_on_time);
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8090/api/updatefeedback'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String,dynamic>{
      'feedback_reply': feedback_reply.toString(),
      'replied_on_time': replied_on_time,
      'replied_on_date': replied_on_date.toString(),
      'feedback_id': feedback_id.toString(),
    }),
  );
  if (response.statusCode == 201) {
    print(feedback_reply);
    if (response.body.isNotEmpty) {
      print(response.body);
    } else {
      print('empty');
    }
    //return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

