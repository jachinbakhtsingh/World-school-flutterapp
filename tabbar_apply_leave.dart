import 'package:flutter/material.dart';

import 'Pending_lists.dart';
import 'apply_leave.dart';
import 'leave_history.dart';

class TabbarApplylLeave extends StatefulWidget {
  const TabbarApplylLeave({Key? key}) : super(key: key);

  @override
  State<TabbarApplylLeave> createState() => _TabbarApplylLeaveState();
}

class _TabbarApplylLeaveState extends State<TabbarApplylLeave> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff03A375),
              title: Text("Leave & OD",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              bottom: TabBar(
                indicatorColor: Colors.white,
                labelPadding: EdgeInsets.all(6),
                tabs: [
                  Text(
                    "Apply",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text("History", style: TextStyle(fontSize: 18)),
                  Text("Requests", style: TextStyle(fontSize: 18))
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ApplyLeave()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Apply Leave",
                          style: TextStyle(fontSize: 15.5),
                        ),
                        Icon(Icons.navigate_next)
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LeaveHistory()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Leave History", style: TextStyle(fontSize: 15.5)),
                        Icon(Icons.navigate_next)
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Pending_List()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pending List", style: TextStyle(fontSize: 15.5)),
                        Icon(Icons.navigate_next)
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
