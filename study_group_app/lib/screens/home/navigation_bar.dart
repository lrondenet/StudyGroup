import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/bottom_navigation_bar_item.dart';
import 'package:study_group_app/screens/home/home.dart';
import 'package:study_group_app/screens/home/group_viewer.dart';
import 'package:study_group_app/screens/groups/group_detail.dart';
import 'package:study_group_app/screens/student/courses.dart';
import 'package:study_group_app/screens/student/select_classes.dart';
import 'package:study_group_app/routes.dart';

// Bottom Navigation Bar
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({ Key key, this.destination }) : super(key: key);
  final Destination destination;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedPage = 0;
  final _pageOptions = [
    HomePage(),
    HomePage(),
    HomePage(),
    CourseSchedulePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: Theme (
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey[900],
          primaryColor: Colors.grey[300],
          textTheme: Theme.of(context).textTheme
            .copyWith(title: TextStyle(color: Colors.white)),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: allDestinations.map((Destination destination) {
            return BottomNavigationBarItem(
              icon: Icon(destination.icon),
              title: Text(destination.title)
            );
          }).toList(),
        ),
      ),
    );
  }
}

// Class for the bottom navigation bar view
class Destination {
  const Destination(this.title, this.icon);
  final String title;
  final IconData icon;
}

// Bottom navigation bar constructors
const List<Destination> allDestinations = <Destination>[
  Destination('Home', Icons.home),
  Destination('Profile', Icons.portrait),
  Destination('Search', Icons.search),
  Destination('Create', Icons.add)
];
