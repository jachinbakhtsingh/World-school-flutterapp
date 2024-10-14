import 'package:flutter/material.dart';

class course_student extends StatefulWidget {
  const course_student({Key? key}) : super(key: key);

  @override
  State<course_student> createState() => _course_studentState();
}

class _course_studentState extends State<course_student> {
  List<course_details> cdetails = [
    course_details(
        Teachername: 'krmsy',
        subjectname: 'englus',
        gradientColors: GradientColors.sky),
    course_details(
        Teachername: 'krmsy',
        subjectname: 'englus',
        gradientColors: GradientColors.sky),
    course_details(
        Teachername: 'krmsy',
        subjectname: 'englus',
        gradientColors: GradientColors.sky),
    course_details(
        Teachername: 'krmsy',
        subjectname: 'englus',
        gradientColors: GradientColors.sky),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03A375),
        title: Text('Student Courses'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: cdetails.map((cdetails) {
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  //color: Colors.blueGrey,
                  //height: 80,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: cdetails.gradientColors),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueGrey,
                            blurRadius: 8,
                            spreadRadius: 4,
                            offset: Offset(4, 4))
                      ],
                      borderRadius: BorderRadius.circular(24)),
                  child: Column(
                    children: <Widget>[
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'English',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Handled by : Mr.S.Kumar',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class course_details {
  final String subjectname;
  final String Teachername;
  List<Color> gradientColors;
  course_details(
      {required this.subjectname,
      required this.Teachername,
      required this.gradientColors});
}

class GradientColors {
  static List<Color> sky = [Color(0xFFA9FFD8), Color(0xFFA9FFD8)];
}
