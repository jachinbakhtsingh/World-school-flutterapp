import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class student extends StatefulWidget {
  const student({Key? key}) : super(key: key);

  @override
  State<student> createState() => _studentState();
}

class _studentState extends State<student> {
  List name = ["jesh", "rajesh"];
  List rollno = ["1234", "2345"];

  List<bool> selections = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    // final List<bool> selections = List.generate(3, (_) => false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance Entry"),
        backgroundColor: const Color(0xff03A375),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Submit",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 55.0,
                            height: 40.0,
                            // color: Colors.green,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "master",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
                      child: ToggleButtons(
                        children: [
                          Text(
                            'P',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('A',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('O',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],

                        isSelected: selections,
                        onPressed: (int Index) {
                          setState(() {
                            selections[Index] = !selections[Index];
                            for (int buttonIndex = 0;
                                buttonIndex < selections.length;
                                buttonIndex++) {
                              if (buttonIndex == Index) {
                                selections[buttonIndex] = true;
                              } else {
                                selections[buttonIndex] = false;
                              }
                            }
                          });
                        },
                        //color: Colors.black,

                        selectedColor: Colors.white,
                        fillColor: selections[0] || selections[1]
                            ? (selections[0] ? Colors.green : Colors.red)
                            : Colors.lightBlue,
                        //borderColor: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: lists(
                  index: index,
                  selections: selections,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class lists extends StatefulWidget {
  const lists({Key? key, this.index, this.selections}) : super(key: key);
  final index;
  final selections;
  @override
  State<lists> createState() => _listsState();
}

class _listsState extends State<lists> {
  // List<bool> selections = List.generate(3, (_) => false);
  List name = ["jesh", "rajesh"];
  List rollno = ["1234", "2345"];
  // static int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 55.0,
                    height: 55.0,
                    // color: Colors.green,
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.green,
                      backgroundImage: AssetImage("images/pikkachu.jpg"),
                    ),
                  ),
                  SizedBox(
                    width: 6.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name[widget.index],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        rollno[widget.index],
                        style: TextStyle(color: Colors.grey, fontSize: 18.0),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
                child: ToggleButtons(
                  children: [
                    Text(
                      'P',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('A', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('O', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                  isSelected: widget.selections,
                  onPressed: (int Index) {
                    setState(() {
                      widget.selections[Index] = !widget.selections[Index];
                      for (int buttonIndex = 0;
                          buttonIndex < widget.selections.length;
                          buttonIndex++) {
                        if (buttonIndex == Index) {
                          widget.selections[buttonIndex] = true;
                        } else {
                          widget.selections[buttonIndex] = false;
                        }
                      }
                    });
                  },
                  selectedColor: Colors.white,
                  fillColor: widget.selections[0] || widget.selections[1]
                      ? (widget.selections[0] ? Colors.green : Colors.red)
                      : Colors.lightBlue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
