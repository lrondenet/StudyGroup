import 'package:flutter/material.dart';
import 'package:study_group_app/theme/style.dart';
import 'package:study_group_app/screens/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Buddy',
      // Importing from theme/style.dart
      theme: appTheme(),
      home: HomePage(title: 'Study Buddy App'),  // Placeholder title for now
    );
  }
}

