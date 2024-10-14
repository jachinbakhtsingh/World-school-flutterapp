import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key, this.data}) : super(key: key);
  final data;
  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03A375),
        title: const Text("Messages"),
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
                  data['feedback_category'],
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
                child: Text(data['feedback_content'])),
            const Text(
              "Reply message:",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
                margin: const EdgeInsets.all(10),
                height: 80,
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 0.5),
                        left: BorderSide(width: 0.5),
                        right: BorderSide(width: 0.5),
                        bottom: BorderSide(width: 1))),
                // color: Colors.grey,
                width: double.infinity,
                child: Text(data['feedback_reply'] ?? 'null')),
          ],
        ),
      ),
    );
  }
}
