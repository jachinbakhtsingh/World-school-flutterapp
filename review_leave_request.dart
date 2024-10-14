import 'package:flutter/material.dart';

class Review_Leave_Request extends StatelessWidget {
  const Review_Leave_Request({Key? key, this.pendingData}) : super(key: key);
  final dynamic pendingData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Review Leave Request"),
        backgroundColor: const Color(0xff03A375),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 9,
              child: Container(
                width: double.infinity,
                height: 230,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("images/pikkachu.jpg"),
                      radius: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Applied by "),
                        Text(
                          "${pendingData.name} ,",
                          style:
                              TextStyle(fontSize: 17, color: Color(0xff305c52)),
                        ),
                      ],
                    ),
                    Text(pendingData.positions),
                    Text("Applied on ${pendingData.appliedOnDate}"),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 9,
              child: Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                height: 220,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Type",
                      style: TextStyle(fontSize: 17, color: Color(0xff305c52)),
                    ),
                    Text(pendingData.typeOfLeave),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Date",
                      style: TextStyle(fontSize: 17, color: Color(0xff305c52)),
                    ),
                    Text(pendingData.Date),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Duration",
                      style: TextStyle(fontSize: 17, color: Color(0xff305c52)),
                    ),
                    Text("${pendingData.days.toString()} "
                        "days(s)"),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Reason",
                      style: TextStyle(fontSize: 17, color: Color(0xff305c52)),
                    ),
                    Text(pendingData.reason),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.done,
                          color: Colors.green,
                        ),
                        Text(
                          "Approve",
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.cancel_outlined,
                          color: Colors.red,
                        ),
                        Text(
                          "Reject",
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
