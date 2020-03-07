import 'package:flutter/material.dart';
import '../../models/groups.dart';
import '../../theme/style.dart';

class GroupView extends StatefulWidget {
  GroupView({Key key}) : super(key: key);

  _GroupState createState() => _GroupState();
}

class _GroupState extends State<GroupView> {
  List groups;

  @override
  void initState() {
    groups = GroupProvider.instance.getGroupsById(2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Material groupCardContent(Group group) => Material(
          borderRadius: BorderRadius.circular(8.0),
          color: Theme.of(context).accentColor,
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            onTap: () {},
            child: Container(
              margin: EdgeInsets.fromLTRB(50.0, 16.0, 16.0, 20.0),
//          constraints: BoxConstraints.expand(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(height: 5.0),
                  Text(group.name, style: Fonts.headerTextStyle),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      height: 1.5,
                      width: 40.0,
                      color: Colors.grey),
                  Row(
                    children: <Widget>[Expanded(child: Text(group.meetDay))],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(child: Text(group.timeBlock)),
                      Expanded(
                          child: Text(
                              'Members: ${group.members}/${group.maxMembers}')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );

    Container groupCard(Group group) => Container(
          height: 120.0,
          margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          decoration: BoxDecoration(
//            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Theme.of(context).accentColor,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: groupCardContent(group),
        );

    return Container(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
//        shrinkWrap: true,
        itemCount: groups.length,
        itemBuilder: (BuildContext context, int index) {
          return groupCard(groups[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Theme.of(context).dividerColor,
          );
        },
      ),
    );
  }
}
