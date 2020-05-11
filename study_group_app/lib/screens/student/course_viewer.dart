// /* COURSES: Simply displays what the student's current schedule is.
//  * This could be useful for:
//  *  - Keeping a history of user's previously classes
//  *  - Saving data for study group matching
//  *  - For future use, can be moved to instead open from user's profile
//  *    as a way for users to see what other users are taking/taken.
//  */

import 'package:flutter/material.dart';
import 'package:study_group_app/models/course.dart';
import 'package:study_group_app/utilities/utilities.dart';

class CourseViewer extends StatelessWidget {
  final List<Course> courses;
  CourseViewer({this.courses});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: courses.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Courses'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              for (final tab in courses) Tab(text: tab.name),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (final tab in courses)
              Center(
                child: getContent(tab, context),
              ),
          ],
        ),
      ),
    );
  }

  Container getContent(Course course, context) {
    return Container(
      child: Column(
        children: <Widget>[
          getTitle(course.name),
          getTime(course, context),
          getDays(course.days, context),
          getDescription(course.description, context),
        ],
      ),
    );
  }

  // Styles and returns a description of the class
  Container getDescription(String description, context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      alignment: Alignment.topCenter,
      child: Text(description, style: Theme.of(context).textTheme.bodyText2),
    );
  }

  Container getDays(String days, context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.subtitle1,
          children: <TextSpan>[
            TextSpan(
              text: 'Days: ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(text: days, style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ),
    );
  }

  // Gets the time course session meets
  Container getTime(Course course, context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.subtitle1,
          children: <TextSpan>[
            TextSpan(
              text: 'Meet Time:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              style: Theme.of(context).textTheme.bodyText1,
              text:
                  ' ${Utility.strToTimeOfDay(course.startTime).format(context).toString()} - '
                  '${Utility.strToTimeOfDay(course.endTime).format(context).toString()}',
            ),
          ],
        ),
      ),
    );
  }

  // Styles the title of each given course
  Container getTitle(String title) {
    return Container(
      padding: EdgeInsets.all(20.0),
      alignment: Alignment.topCenter,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
