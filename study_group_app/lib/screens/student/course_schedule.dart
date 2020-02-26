/* USER INPUT FOR COURSE SCHEDULE 
    A form and view for users to input their current school schedule
    for the semester or quarter. It will display the school time
    slots in a week view.
*/

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

// Stateful course schedule page class.
class CourseSchedulePage extends StatefulWidget {
  CourseSchedulePage({Key key, this.title}) : super(key: key);
  final String title; // final keyword b/c title is in sub widget

  @override
  // Creates the stateful widget HomePage
  _CourseSchedulePageState createState() => _CourseSchedulePageState();
}

// Inherits from CourseSchedulePage above
class _FormHandler extends State<CourseSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      home: Material (
        child: Stack(
          children: <Widget>[
            Container(
              
            )
          ],
        )
      )
    );
  }
}
  
 // Inherits from CourseSchedulePage above
class _CourseSchedulePageState extends State<CourseSchedulePage> {
  // Calendar display
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Sunday'),
            Text('Monday'),
            Text('Tuesday'),
            Text('Wednesday'),
            Text('Thursday'),
            Text('Friday'),
            Text('Saturday'),
          ]
        ),
      )
    )
  }
}