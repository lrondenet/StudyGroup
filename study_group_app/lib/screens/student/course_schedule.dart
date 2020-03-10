/* USER INPUT FOR COURSE SCHEDULE 
    A form and view for users to input their current school schedule
    for the semester or quarter. It will display the school time
    slots in a week view.
*/

import 'package:calendar_strip/calendar_strip.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


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

  // Form data
  String courseName;
  DateTime _dateTime;

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
                                    saveSchedule();
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

  // Displays the schedule
  void displaySchedule(BuildContext context){
    Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyCoursePageState(
                //courseName: getName(),
                //courseDay: getDay(),
              )
            )
    );
  }

  // Save data from the schedule form to the database
  void saveSchedule() {
    Firestore.instance
        .collection('course_schedule')
        .document('PZ9SBOsMrl2AtHbsrHvR')
        .updateData({
          'course_name':courseNameController.text,
          'course_datetime': _dateTime,
        });
  }

  // Get data from the database
  String getName(){
    Firestore.instance
        .collection('course_schedule')
        .document('PZ9SBOsMrl2AtHbsrHvR')
        .get()
        .then((DocumentSnapshot ds) {
          return ds.data['course_name'];
        });
  }

  String getDay(){
    Firestore.instance
        .collection('course_schedule')
        .document('PZ9SBOsMrl2AtHbsrHvR')
        .get()
        .then((DocumentSnapshot ds) {
          return ds.data['course_day'];
        });
  }

}
  
 // Displays the given information
class MyCoursePageState extends StatelessWidget {
  
  // Schedule display constructor
  //final String courseName;
  //final String courseDay;
  //MyCoursePageState({Key key, @required this.courseName, @required this.courseDay}) : super(key: key);
  MyCoursePageState({Key key}) : super(key: key);


  // Calendar display
  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text("My Course Schedule"),
      ),
      body: Container(
        child: CalendarStrip(
          startDate: now,
          endDate: now.add(new Duration(days:60)),
          onDateSelected: onSelect,
          )
      ),
    );
  }

  // Get data from the database
  String getName(){
    Firestore.instance
        .collection('course_schedule')
        .document('PZ9SBOsMrl2AtHbsrHvR')
        .get()
        .then((DocumentSnapshot ds) {
          return ds.data['course_name'];
        });
  }

  onSelect(data) {
    return Scaffold(
      body: Container(
        child: SfCalendar(
          view: CalendarView.day,
          timeSlotViewSettings: TimeSlotViewSettings(
            timeTextStyle: TextStyle(color: Colors.black),
            timeRulerSize: 100,
            timeInterval: Duration(hours: 1),
          ),
        ),
      )
    );
  }
}
