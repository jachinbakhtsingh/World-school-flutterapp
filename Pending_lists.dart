import 'package:flutter/material.dart';
import 'package:myapp/Apply_leave_od/pending_model.dart';
import 'package:myapp/Apply_leave_od/review_leave_request.dart';

class Pending_List extends StatelessWidget {
  Pending_List({Key? key}) : super(key: key);

  List<Pending> pendingItem = [
    Pending("rajesh", "Software Developer", "Applied Permission", 2,
        "Casual Leave", "22/12/22", "21/12/22"),
    Pending("akash", "Programmer", "Applied Permission", 3, "Casual Leave",
        "22/12/22", "21/12/22"),
    Pending("jachin", "Software Developer", "Applied Permission", 1,
        "Casual Leave", "22/12/22", "21/12/22"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff03A375),
          title: Text("Pending List"),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: pendingItem.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Review_Leave_Request(
                                pendingData: pendingItem[index],
                              )));
                    },
                    focusColor: Colors.grey,
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('images/pikkachu.jpg'),
                      radius: 20,
                    ),
                    title: Text(
                      pendingItem[index].name,
                      style: TextStyle(color: Color(0xff305c52), fontSize: 18),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(pendingItem[index].positions),
                        Text(pendingItem[index].typeOfLeave),
                      ],
                    ),
                    trailing: Container(
                      child: Column(
                        children: [
                          Text(pendingItem[index].days.toString()),
                          Text("Day(s)")
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
