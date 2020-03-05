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
          color: Theme.of(context).dividerColor,
          child: InkWell(
            splashColor: Colors.orangeAccent,
            child: Container(
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(
                              width: 1.0,
                              color: Theme.of(context).backgroundColor))),
                  child: Icon(Icons.group),
                ),
                title: Text(cur.name),
                subtitle: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: Text(cur.meetDay),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: EdgeInsets.only(left: 30.0),
                            child: Text(cur.timeBlock)))
                  ],
                ),
                trailing: IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {
                      setState(() {
                        print("testing");
                      });
                    }),
              ),
            ),
            onTap: () {},
          ),
        );
      },
    );
  }
}
