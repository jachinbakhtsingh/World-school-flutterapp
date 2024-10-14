import 'package:flutter/material.dart';

import '../Apply_leave_od/tabbar_apply_leave.dart';
import '../Feedback/feedback.dart';
import '../Time_Table/timetable.dart';
import '../aboutus.dart';
import '../application_form.dart';
import '../courses.dart';
import '../student_exam_results.dart';

class Drawers extends StatelessWidget {
  const Drawers({Key? key, required this.homeData, this.loginData})
      : super(key: key);

  final List<dynamic> homeData;
  final loginData;

  divider() {
    return const Divider(
      height: 2.0,
      indent: 15.0,
      endIndent: 15.0,
      thickness: 1.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 50.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff03A375),
              ),

              //child: Text("Profile"),
              child: Icon(
                Icons.account_circle_rounded,
                size: 130,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text(
                'Courses',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const course_student()));
              },
            ),
            divider(),
            ListTile(
              leading: const Icon(Icons.add_card_outlined),
              title: const Text(
                'Time Table',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const timetable()));
              },
            ),
            divider(),
            ListTile(
              leading: const Icon(Icons.account_circle_sharp),
              title: const Text(
                'Apply leave & OD',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TabbarApplylLeave()));
              },
            ),
            divider(),
            ListTile(
              leading: const Icon(Icons.ad_units),
              title: const Text(
                'Exam  Result',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              //  Icons.account_circle,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudentResults()));
              },
            ),
            divider(),
            ListTile(
              leading: const Icon(Icons.ad_units),
              title: const Text(
                'Feedback',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              //  Icons.account_circle,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FeedBack(
                          homeData: homeData,
                          loginData: loginData,
                        )));
              },
            ),
            divider(),
            ListTile(
              leading: const Icon(Icons.account_circle_outlined),
              title: const Text(
                'Application Form',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              //  Icons.account_circle,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Application_form()));
              },
            ),
            divider(),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text(
                'About Us',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => aboutus()));
              },
            ),
            divider(),
          ],
        ));
  }
}
