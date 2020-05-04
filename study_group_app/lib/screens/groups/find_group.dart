import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_group_app/models/groups.dart';
import 'package:study_group_app/models/user.dart';
import 'package:study_group_app/services/group_provider.dart';

class FindGroup extends StatelessWidget {
  Future<List<Group>> _search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    var result = await GroupProvider().findGroup(search);
    var filteredGroups = List<Group>();
    result.forEach((g) {
      if (!(g.memberIds.length >= g.maxMembers)) {
        filteredGroups.add(g);
      }
    });
    return filteredGroups;
  }

  void _joinGroup(String userId, Group group) {
    var result = GroupProvider().updateGroupMember(group.id, userId);
    if (result == null) {
      print("Error, couldn't update group");
      return null;
    }
  }

  Widget _findGroupResult(context, Group group) {
    var user = Provider.of<User>(context);
    return Center(
      child: Card(
        color: Theme.of(context).accentColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                group.name,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(group.location),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text("Join Group"),
                  onPressed: () async {
                    await _joinGroup(user.uid, group);
                  },
                ),
                FlatButton(
                  child: Text("More Information"),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SearchBar<Group>(
          hintText: "Search for a group...",
          onSearch: _search,
          onItemFound: (Group grp, int index) {
            return _findGroupResult(context, grp);
          },
          emptyWidget: Text("No groups found with that name"),
          searchBarStyle: SearchBarStyle(
            backgroundColor: Colors.white10,
            borderRadius: BorderRadius.circular(12.0),
            // padding: EdgeInsets.all(5),
          ),
        ),
      ),
    );
  }
}
