import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateGroup extends StatefulWidget {
  CreateGroup({Key key, this.title}) : super(key: key);
  final String title; // final keyword b/c title is in sub widget

  @override
  // Creates the stateful widget HomePage
  _CreateGroupFormState createState() => _CreateGroupFormState();
}

class _CreateGroupFormState extends State<CreateGroup> {
  final timeFormat = DateFormat("h:mm a");
  TimeOfDay _selectedTime;
  TextEditingController _timeValue;

  @override
  void initState() {
    _timeValue = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _timeValue.dispose();
    super.dispose();
  }

  var selectType;
  final List<String> days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thrusday',
    'Friday',
    'Saturday'
  ];
  Future<void> selectTime(context) async {
    final TimeOfDay _time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (_time != null) {
      setState(() {
        _selectedTime = _time;
        _timeValue.text = _time.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF80CBC4),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Create a New Group',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 40),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: FaIcon(FontAwesomeIcons.users),
                      labelText: "Group Name",
                    ),
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField(
                    value: selectType,
                    decoration: InputDecoration(
                        icon: FaIcon(FontAwesomeIcons.calendarAlt),
                        labelText: 'Date'),
                    items: days.map((value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (selectDays) {
                      setState(() {
                        selectType = selectDays;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    readOnly: true,
                    controller: _timeValue,
                    onTap: () async {
                      await selectTime(context);
                    },
                    decoration: InputDecoration(
                      icon: FaIcon(FontAwesomeIcons.clock),
                      labelText: 'Time',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        icon: FaIcon(FontAwesomeIcons.mapMarkedAlt),
                        labelText: 'Location'),
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
                        'CREATE GROUP',
                        style: TextStyle(
                          color: Color(0xFF80CBC4),
                          letterSpacing: 1.5,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
