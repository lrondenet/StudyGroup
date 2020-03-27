import 'package:flutter/material.dart';

class GroupDetail extends StatefulWidget {
  GroupDetail({Key key}) : super(key: key);

  @override
  _GroupDetailState createState() => _GroupDetailState();
}

class _GroupDetailState extends State<GroupDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Group Detail"),
        ],
      ),
    );
  }
}
