import 'package:flutter/material.dart';

import 'community1.dart';
import 'community2.dart';

class community extends StatefulWidget {
  @override
  State<community> createState() => _communityState();
}

class _communityState extends State<community> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03A375),
        title: Text("Community Report"),
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            FixedColumnWidget(),
            ScrollableColumnWidget(),
          ],
        ),
      ),
    );
  }
}
