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

  // Form controllers
  TextEditingController courseNameController = TextEditingController();
  TextEditingController courseDayController = TextEditingController();
  TextEditingController courseTimeController = TextEditingController();

  void dispose() {
  courseNameController.dispose();
  courseDayController.dispose();
  courseTimeController.dispose();
  super.dispose();
  }

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
                                controller: courseNameController,
                                cursorColor: Colors.black,
                                decoration:InputDecoration(
                                  hintText: "Enter your class name",
                                  border: OutlineInputBorder(),
                                )
                            ),
                            TextFormField (
                              controller: courseDayController,
                                cursorColor: Colors.black,
                                decoration:InputDecoration(
                                  hintText: "Enter the Day",
                                  border: OutlineInputBorder(),
                                )
                            ),
                            TextFormField (
                                controller: courseTimeController,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: "Enter the Time",
                                  border: OutlineInputBorder(),
                                )
                            ),
                            SizedBox (
                                width: 320,
                                child: FlatButton (
                                  onPressed: (){
                                    displaySchedule(context);
                                  },
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

  void displaySchedule(BuildContext context){
    String courseName = courseNameController.text;
    String courseDay = courseDayController.text;
    //TimeOfDay courseTime = courseTimeController.text
    Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyCoursePageState(
                courseName: courseName,
                courseDay: courseDay,
                )
            ));
      }
  }
  
 // Inherits from CourseSchedulePage above
 // Displays the given information
class MyCoursePageState extends StatelessWidget {
  
  // Schedule display constructor
  final String courseName;
  final String courseDay;
  MyCoursePageState({Key key, @required this.courseName, @required this.courseDay}) : super(key: key);

  // Calendar display
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Course Schedule"),
      ),
      body: Text(courseName)
    );
  }
}
