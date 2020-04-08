import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/bottom_navigation_bar_item.dart';
import 'package:study_group_app/screens/home/home.dart';
import 'package:study_group_app/screens/home/group_viewer.dart';
import 'package:study_group_app/screens/student/select_classes.dart';

class BottomNavBarView extends StatefulWidget {
  //BottomNavBarView({Key key}) : super(key: key);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBarView> {
  int _curIndex = 0;

  @override
  Widget build(BuildContext context){
    return Theme (
      data: Theme.of(context).copyWith(
        canvasColor: Colors.grey[900],
        primaryColor: Colors.white,
        textTheme: Theme.of(context).textTheme
          .copyWith(title: TextStyle(color: Colors.white)),
      ),
      child: BottomNavigationBar( 
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 40,
              color: Colors.white,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.portrait,
              size: 40,
              color: Colors.white,
            ),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 40,
              color: Colors.white,
            ),
            title: Text(
              'Find',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              size: 40,
              color: Colors.white,
            ),
            title: Text(
              'Create',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        onTap: _routeToPage,
      )
    );
  }

  _routeToPage(int index) {
    setState(() {
      _curIndex = index;
      if(_curIndex == 0) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
      else if (_curIndex == 1) {
        // Insert navigation to profile page
      }
      else if (_curIndex == 2) {
        // Insert navigation to "search for study groups" page
      }
      else if (_curIndex == 3) {
        // Change to navigate to the create study groups page
        Navigator.of(context).pushNamed("/select-classes");
      }
    }
    );
  }
}