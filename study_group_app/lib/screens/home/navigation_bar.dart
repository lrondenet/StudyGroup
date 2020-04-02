import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/bottom_navigation_bar_item.dart';

class BottomNavBarView extends StatefulWidget {
  BottomNavBarView({Key key}) : super(key: key);

  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<BottomNavBarView> {
  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
      backgroundColor: Colors.black45,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
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
            color: Colors.white,
          ),
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          title: Text(
            'Create',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
      onTap: null,
    );
  }
}