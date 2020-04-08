import 'package:flutter/material.dart';
import 'package:study_group_app/screens/home/navigation_bar.dart';


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
