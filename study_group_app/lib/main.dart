import 'package:flutter/material.dart';
import 'package:study_group_app/theme/style.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Buddy',
      // Importing from theme/style.dart
      theme: appTheme(),
      home: MyHomePage(title: 'Study Buddy App'),  // Placeholder title for now
    );
  }
}

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Right here they had an additional function that increased a counter. 
  // They are just talking about how to update the view when something changes in the app
  // by calling setState() Below is original comment.
  
  // setState tells the Flutter framework that something has
  // changed in this State, which causes it to rerun the build method below
  // so that the display can reflect the updated values.
  @override
  Widget build(BuildContext context) {
     // The build method is rerun every time setState is called
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
        drawer:Drawer(
          child: ListView(children:[]),
        ),


      // Center is a layout widget. It takes a single child and positions it
     // in the middle of the parent.

       
    );
  }
}
