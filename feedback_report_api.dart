import 'dart:convert';
import 'package:http/http.dart' as http;

class Feeddback {
  final int feedback_id;
  final String feedback_sender;
  final String feedback_reciever;
  final String feedback_content;
  final String created_on_date;
  final String created_on_time;
  final String feedback_category;

  const Feeddback({
    required this.feedback_id,
    required this.feedback_sender,
    required this.feedback_reciever,
    required this.feedback_content,
    required this.created_on_date,
    required this.created_on_time,
    required this.feedback_category,
  });

  factory Feeddback.fromJson(Map<String, dynamic> json) {
    return Feeddback(
      feedback_id: json["feedback_id"],
      feedback_sender: json["feedback_sender"],
      feedback_reciever: json["feedback_reciever"],
      feedback_content: json["feedback_content"],
      created_on_date: json["created_on_date"],
      created_on_time: json["created_on_time"],
      feedback_category: json["feedback_category"],
    );
  }
}

Future<Feeddback> createFeedback({
  required int feedback_id,
  required String feedback_sender,
  required String feedback_reciever,
  required String feedback_content,
  required String created_on_date,
  required String created_on_time,
  required String feedback_category,
}) async {
  // print(feedback_id.toString());
  // print(feedback_sender);
  // print(feedback_reciever);
  // print(feedback_content.toString());
  // print(created_on_date.toString());
  // print(created_on_time.toString());
  // print(feedback_category.toString());

  // print('api call');
  try {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8090/api/feedback'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'feedback_id': feedback_id,
        "feedback_sender": feedback_sender,
        "feedback_reciever": feedback_reciever,
        "feedback_content": feedback_content,
        "created_on_date": created_on_date,
        "created_on_time": created_on_time,
        "feedback_category": feedback_category,
      }),
    );
    print('status code feedbackReport ${response.statusCode}');
    if (response.statusCode == 201) {
      print(feedback_id);

      if (response.body.isNotEmpty) {
        print('not empty');
      } else {
        print('empty');
      }

      return Feeddback.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create feedback.');
    }
  } catch (e) {
    throw (e.toString());
  }
}
