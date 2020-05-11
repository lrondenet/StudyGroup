import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Stateful course schedule page class.
class AddCourses extends StatefulWidget {
  AddCourses({Key key, this.title}) : super(key: key);
  final String title; // final keyword b/c title is in sub widget

  @override
  // Creates the stateful widget HomePage
  _MyCourseFormState createState() => _MyCourseFormState();
}

// Inherits from CourseSchedulePage above
class _MyCourseFormState extends State<AddCourses> {
  // Form controllers
  TextEditingController courseNameController = TextEditingController();
  TextEditingController courseDayController = TextEditingController();
  TextEditingController courseTimeController = TextEditingController();

  // Form data
  // DateTime _dateTime;

  @override
  void dispose() {
    courseNameController.dispose();
    courseDayController.dispose();
    courseTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: Text("Course Schedule"),
      // ),
      backgroundColor: Color(0xFF98c1d9),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      'Create a Course Schedule',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      onChanged: (val) {
                        courseNameController.text = val;
                      },
                      decoration: InputDecoration(
                        icon: FaIcon(FontAwesomeIcons.pencilAlt),
                        labelText: 'Course Name',
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      onChanged: (val) {
                        courseDayController.text = val;
                      }
                      decoration: InputDecoration(
                        icon: FaIcon(FontAwesomeIcons.calendarDay),
                        labelText: 'Day',
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        icon: FaIcon(FontAwesomeIcons.clock),
                        labelText: 'Start Time',
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        icon: FaIcon(FontAwesomeIcons.solidClock),
                        labelText: 'End Time',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 17),
                      //width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {},
                        //color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'CREATE CLASS',
                          style: TextStyle(
                            color: Color(0xFF98c1d9),
                            letterSpacing: 1.5,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
