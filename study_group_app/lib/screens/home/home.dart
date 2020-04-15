import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'drawer.dart';
import 'package:study_group_app/models/user.dart';
import 'package:study_group_app/screens/student/select_classes.dart';
import 'package:study_group_app/services/group_provider.dart';
import 'package:study_group_app/screens/groups/group_viewer.dart';
import 'package:study_group_app/models/groups.dart';

// Stateful home page class.
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
// Creates the stateful widget HomePage
  _HomePageState createState() => _HomePageState();
}

// Inherits from HomePage above
class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  final _pageOptions = [
    GroupView(),
    CourseSchedulePage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  // Main build function, generates the view
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return StreamProvider<List<Group>>.value(
      value: GroupProvider(userUid: user.uid).groupData,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        // Top bar, title is set using widget.title which is passed down from main
        appBar: AppBar(
          title: Text("Home"),
        ),
        // drawer sets the hamburger menu on the side that pops out
        // its' child is a ListView that holds all the elements held in the drawer
        drawer: MainDrawer(),
        body: SafeArea(top: false, child: _pageOptions[_selectedPage]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: allDestinations.map((Destination destination) {
            return BottomNavigationBarItem(
                icon: Icon(destination.icon), title: Text(destination.title));
          }).toList(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class Destination {
  const Destination(this.title, this.icon);
  final String title;
  final IconData icon;
}

// Bottom navigation bar constructors
const List<Destination> allDestinations = <Destination>[
  Destination('Home', Icons.home),
  // Destination('Profile', Icons.portrait),
  // Destination('Search', Icons.search),
  Destination('Create', Icons.add)
];
