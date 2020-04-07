import 'package:flutter/material.dart';
import 'package:study_group_app/screens/groups/group_detail.dart';
import 'package:study_group_app/screens/student/select_classes.dart';
import 'package:study_group_app/screens/home/home.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/select-classes':
        return MaterialPageRoute(builder: (_) => CourseSchedulePage());
      case '/group-detail':
        return MaterialPageRoute(builder: (_) => GroupDetail());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

// routes: <String, WidgetBuilder>{
// "/select-classes": (BuildContext context) => CourseSchedulePage(),
// }
// }
