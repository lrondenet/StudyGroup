import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';




class CreateGroup extends StatefulWidget {
  CreateGroup({Key key, this.title}) : super(key: key);
  final String title; // final keyword b/c title is in sub widget

  @override
  // Creates the stateful widget HomePage
  _CreateGroupFormState createState() => _CreateGroupFormState();
}

class _CreateGroupFormState extends State<CreateGroup> {
  final dateFormat = DateFormat("EEE, MM-dd-yyyy");
  final timeFormat = DateFormat("h:mm a");
  DateTime date;
  TimeOfDay time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF80CBC4),
      //Color(0xFF30CFD0),
      //Color(0xFF330867),
      //Color(0xFF80CBC4),
      appBar: AppBar(
        title: Text('New Group'),
      ),
      body: Stack(
        children: <Widget> [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Create a New Group',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    )
                ),
                SizedBox(height: 40),
                TextFormField(
                  decoration: InputDecoration(
                    icon: FaIcon(FontAwesomeIcons.users),
                    labelText: "Group Name",
                  ),
                ),
                SizedBox(height:20),
                DateTimePickerFormField(
                  initialDate:DateTime.now(),
                  dateOnly: true,
                  format: dateFormat,
                  decoration: InputDecoration(
                    icon: FaIcon(FontAwesomeIcons.calendarAlt),
                    labelText: 'Date'
                  ),
                  onChanged: (dt) => setState(() => date = dt),
                ),
                SizedBox(height:20),
                TimePickerFormField(
                  initialTime: TimeOfDay.now(),
                  format: timeFormat,
                  decoration: InputDecoration(
                    icon: FaIcon(FontAwesomeIcons.clock),
                    labelText: 'Time',
                  ),
                  onChanged: (t) => setState(() => time = t),
                ),
                SizedBox(height:20),
                TextFormField(
                  decoration:InputDecoration(
                    icon: FaIcon(FontAwesomeIcons.mapMarkedAlt),
                    labelText:'Location'
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 17),
                  //width: double.infinity,
                  child: RaisedButton(
                    onPressed: (){},
                    //color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'CREATE GROUP',
                      style: TextStyle(
                        color: Color(0xFF80CBC4),
                        letterSpacing: 1.5,
                        fontSize: 14,
                      )
                    )
                  )
                ),
              ],
            )
          )
        ]
      )
    );
  }
}
