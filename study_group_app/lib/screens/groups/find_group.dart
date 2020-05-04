import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:study_group_app/models/groups.dart';
import 'package:study_group_app/services/group_provider.dart';

class FindGroup extends StatefulWidget {
  FindGroup({Key key}) : super(key: key);

  @override
  _FindGroupState createState() => _FindGroupState();
}

class _FindGroupState extends State<FindGroup> {
  Future<List<Group>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return GroupProvider().findGroup(search);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SearchBar<Group>(
          onSearch: search,
          onItemFound: (Group grp, int index) {
            return ListTile(
              title: Text(grp.name),
              subtitle: Text(grp.location),
            );
          },
          hintText: "Search for a group...",
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
