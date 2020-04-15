import 'package:flutter/material.dart';
import 'package:study_group_app/screens/home/home.dart';
import 'package:study_group_app/services/auth.dart';
import 'package:study_group_app/utilities/style.dart';
import 'package:study_group_app/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:study_group_app/models/user.dart';
import 'package:study_group_app/routes.dart';
import 'package:study_group_app/screens/home/navigation_bar.dart';
import 'package:study_group_app/screens/home/group_viewer.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Auth().getUser,
      child: MaterialApp(
        title: 'Study Buddy',
        // Importing from theme/style.dart
        theme: appTheme(),
        // Allows navigation to determine what to display
        home: BottomNavBar(),
        onGenerateRoute: Routes.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}
