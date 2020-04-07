import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/bottom_navigation_bar_item.dart';

class BottomNavBarView extends StatefulWidget {
  BottomNavBarView({Key key}) : super(key: key);

  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBarView> {
  var _curIndex = 0;

  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
      //backgroundColor: Colors.black45,
      backgroundColor: Colors.grey[900],
      currentIndex: _curIndex,
      items: const <BottomNavigationBarItem>[
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
    );
  }

  _routeToPage(int index) {
    setState(() {
      _curIndex = index;
      if(_curIndex == 0)
      {
        Navigator.of(context).pushNamed("/group-detail");
      }
      else if (_curIndex == 1) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
      else if (_curIndex == 2) {
        Navigator.of(context).pushNamed("/select-classes");
      }
    });
  }

}