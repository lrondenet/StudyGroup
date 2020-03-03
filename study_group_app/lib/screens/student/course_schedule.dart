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
  _MyCourseFormState createState() => _MyCourseFormState();
}

// Inherits from CourseSchedulePage above
class _MyCourseFormState extends State<CourseSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
        home: Material (
            child: Stack(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 100.0),
                    child: Center (
                        child: Column (
                          children: <Widget>[
                            Text ("Enter your Class Schedule",
                              style: TextStyle (
                                fontWeight: FontWeight.bold,
                                fontSize:20,
                              )
                            ),
                            TextFormField (
                                cursorColor: Colors.black,
                                decoration:InputDecoration(
                                  hintText: "Enter your class name",
                                  border: OutlineInputBorder(),
                                )
                            ),
                            TextFormField (
                                cursorColor: Colors.black,
                                decoration:InputDecoration(
                                  hintText: "Enter the Date",
                                  border: OutlineInputBorder(),
                                )
                            ),
                            TextFormField (
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: "Enter the Time",
                                  border: OutlineInputBorder(),
                                )
                            ),
                            SizedBox (
                                width: 320,
                                child: FlatButton (
                                  onPressed: (){},
                                  child: Text("Submit",
                                  ),
                                  color: Colors.blueAccent,
                                )
                            )
                          ],
                        )
                    )
                )
              ],
            )
        )
    );
  }
}
  
 // Inherits from CourseSchedulePage above
class _CourseSchedulePageState extends State<CourseSchedulePage> {
  // Controller that updates user view from form
  final formController = TextEditingController();

  // Clean up the controller when the widget is disposed
  @override
  void dispose() {
    formController.dispose();
    super.dispose();
  }

  // Calendar display
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              'Sunday',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            height: 30.0,
            width: 90.0,
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              'Monday',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            height: 30.0,
            width: 90.0,
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              'Tuesday',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            height: 30.0,
            width: 90.0,
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              'Wednesday',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            height: 30.0,
            width: 90.0,
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              'Thursday',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            height: 30.0,
            width: 90.0,
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              'Friday',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            height: 30.0,
            width: 90.0,
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              'Saturday',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            height: 30.0,
            width: 90.0,
          ),
        ],
      ),
    );
  }
}
