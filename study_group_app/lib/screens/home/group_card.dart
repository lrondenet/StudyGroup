import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../models/groups.dart';

class GroupCards extends StatefulWidget {
  GroupCards({Key key}) : super(key: key);

  @override
  _GroupCards createState() => _GroupCards();
}

class _GroupCards extends State<GroupCards> {
  final grps = GroupProvider.instance.getGroupsById(0);

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: grps.length,
      itemBuilder: (BuildContext context, int index) {
        Group cur = grps[index];
        return Card(
          child: Container(
            child: ListTile(
              title: Text(cur.name),
              leading: Text(cur.meetDay.toString()),
              trailing: Text(cur.timeBlock),
            ),
          ),
        );
      },
    );
  }
}
//    return Column(
//      children: <Widget>[
//        Card(
//          color: Theme.of(context).hintColor,
//          child: Column(
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              Material(
//                color: Theme.of(context).dividerColor,
//                child: InkWell(
//                  child: const ListTile(
//                    leading: Icon(Icons.sentiment_very_satisfied),
//                    title: Text('Study Group: Example Group 1',
//                        style: TextStyle(
//                            color: Colors.black, fontWeight: FontWeight.bold)),
//                    subtitle: Text(
//                      'Some basic information about the group can go here.',
//                      style: TextStyle(
//                          color: Colors.black, fontWeight: FontWeight.w400),
//                    ),
//                  ),
//                  onTap: () {},
//                ),
//              ),
//            ],
//          ),
//        ),
//        Card(
//          color: Theme.of(context).dividerColor,
//          child: Column(
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              const ListTile(
//                leading: Icon(Icons.group),
//                title: Text('Study Group: Example Group 2',
//                    style: TextStyle(
//                        color: Colors.black, fontWeight: FontWeight.bold)),
//                subtitle: Text(
//                  'Different stuff about another group.',
//                  style: TextStyle(
//                      color: Colors.black, fontWeight: FontWeight.w400),
//                ),
//              ),
//              ButtonBar(
//                children: <Widget>[
//                  RaisedButton(
//                    textColor: Colors.white,
//                    child: const Text(
//                      'View Group',
//                      style: TextStyle(color: Color(0xfffd8100)),
//                    ),
//                    onPressed: () {
//                      /* ... */
//                    },
//                  ),
//                ],
//              ),
//            ],
//          ),
//        ),
//      ],
//    );
//  }
//}
