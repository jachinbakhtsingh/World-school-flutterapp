import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class notifications extends StatefulWidget {
  const notifications({Key? key}) : super(key: key);

  @override
  State<notifications> createState() => _notificationsState();
}

class _notificationsState extends State<notifications> {
  List date = ["12-09-2022", "13-09-2022", "14-09-2022"];
  List time = [
    "7:10 AM",
    "8:20 AM",
    "9:10 PM",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03A375),
        title: Text("Notifications"),
      ),
      body: Container(margin: EdgeInsets.only(top: 10), child: listView()),
    );
  }

  Widget listView() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Container(
            margin: EdgeInsets.only(top: 8),
            //decoration: BoxDecoration(border: Border.fromBorder.symmetric())),
            child: listViewItem(index));
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 5,
        );
      },
      itemCount: 3,
    );
  }

  Widget listViewItem(int index) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon(),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message(index),
                  timeAndDate(index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget prefixIcon() {
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: Icon(
        Icons.notifications,
        size: 30,
        color: Colors.grey.shade700,
      ),
    );
  }

  Widget message(int index) {
    double textSize = 14;
    return Container(
      child: RichText(
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: 'Message',
          style: TextStyle(
              fontSize: textSize,
              color: Colors.black,
              fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: 'Message Description',
                style: TextStyle(fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }

  Widget timeAndDate(int index) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date[index],
                style: TextStyle(fontSize: 10),
              ),
              Text(
                time[index],
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
