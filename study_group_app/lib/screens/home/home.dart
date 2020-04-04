import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_group_app/screens/home/drawer.dart';
import 'package:study_group_app/models/user.dart';
import 'package:study_group_app/services/user_provider.dart';
import 'package:study_group_app/utilities/loading.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'group_viewer.dart';

// Stateful home page class.
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title; // final keyword b/c title is in sub widget

  @override
// Creates the stateful widget HomePage
  _HomePageState createState() => _HomePageState();
}

// Inherits from HomePage above
class _HomePageState extends State<HomePage> {
  @override
  // Main build function, generates the view
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: UserProvider(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              // Top bar, title is set using widget.title which is passed down from main
              appBar: AppBar(
                title: Text(widget.title),
              ),
              // drawer sets the hamburger menu on the side that pops out
              // its' child is a ListView that holds all the elements held in the drawer
              drawer: MainDrawer(),

              // TODO: Add or transform this into a bottom bar
              persistentFooterButtons: <Widget>[
                RaisedButton.icon(
                  onPressed: () {
                    print(userData.email);
                  },
                  color: Colors.blueAccent,
                  label: Text('Find Group'),
                  icon: Icon(Icons.search),
                )
              ],
              body: GroupView(),
            );
          } else {
            return Loading();
          }
        });
  }
}
