import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'admin_profile_staff.dart';
import 'admin_student.dart';

class admin_profile extends StatefulWidget {
  const admin_profile({Key? key}) : super(key: key);

  @override
  State<admin_profile> createState() => _admin_profileState();
}

class _admin_profileState extends State<admin_profile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController = new TabController(length: 2, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 0);
  }

  List detailsName = ['Esakki', 'Mothilal', 'Samuel', 'Rahul'];
  List detailsId = ['24232', '453234', '53223', '442453'];
  List detailsImage = [
    'images/pikkachu.jpg',
    'images/pikkachu.jpg',
    'images/pikkachu.jpg',
    'images/pikkachu.jpg'
  ];
  List studetailsName = ['Esakki', 'Mothilal', 'Samuel', 'Rahul'];
  List studetailsId = ['24232', '453234', '53223', '442453'];
  List studetailsImage = [
    'images/pikkachu.jpg',
    'images/pikkachu.jpg',
    'images/pikkachu.jpg',
    'images/pikkachu.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.green));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff03A375),
          title: Text("Admil_Report"),
          bottom: TabBar(
            indicator: UnderlineTabIndicator(
                insets: EdgeInsets.symmetric(horizontal: 16.0)),
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                child: Text(
                  "Staff",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Tab(
                child: Text(
                  "Student",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              )
            ],
          ),
        ),
        body: Container(
          height: 1000, // MediaQuery.of(context).size.height - 3,
          width: double.infinity,
          child: TabBarView(
            controller: _tabController,
            children: [admin_Staff(), admin_student()],
          ),
        ));
  }
}
