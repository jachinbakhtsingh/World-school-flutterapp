import 'package:flutter/material.dart';
import 'history_model.dart';

class LeaveHistory extends StatelessWidget {
  const LeaveHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<History> items = [
      History('Applied for casual leave', 2, '22/9/22', 'Approved',
          'Going to Hospital'),
      History('Applied for personal work', 1, '22/9/22', 'Approved',
          'Personal WOrk'),
      History('Applied for casual leave', 2, '22/9/22', 'Pending',
          'Going to Hospital'),
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff03A375),
          title: Text("Leave History"),
        ),
        body: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/pikkachu.jpg'),
                        radius: 20,
                      ),
                    ),
                    Container(
                      width: 300,
                      child: Column(children: [
                        Text(
                          items[index].title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Duration",
                                    style: TextStyle(color: Color(0xff305c52)),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Container(
                                    child:
                                        Text(items[index].duration.toString()),
                                  )
                                ],
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Date",
                                    style: TextStyle(color: Color(0xff305c52)),
                                  ),
                                  SizedBox(
                                    width: 120,
                                  ),
                                  Container(
                                    child: Text(items[index].date),
                                  )
                                ],
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              Row(
                                children: [
                                  Text("Status",
                                      style:
                                          TextStyle(color: Color(0xff305c52))),
                                  SizedBox(
                                    width: 110,
                                  ),
                                  Container(
                                    child: Text(
                                      items[index].status,
                                      style: TextStyle(
                                          color:
                                              items[index].status == "Approved"
                                                  ? Colors.green
                                                  : Colors.amber),
                                    ),
                                  )
                                ],
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              Row(
                                children: [
                                  Text("Reason",
                                      style:
                                          TextStyle(color: Color(0xff305c52))),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Container(
                                    child: Text(items[index].reason),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              if (items[index].status == "Pending")
                                Padding(
                                  padding: const EdgeInsets.only(left: 100),
                                  child: Container(
                                    child: OutlinedButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.red),
                                        )),
                                  ),
                                )
                            ]),
                      ]),
                    )
                  ],
                ),
              );
            },
            itemCount: items.length));
  }
}
