import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:study_group_app/models/groups.dart';
import 'package:study_group_app/services/group_provider.dart';

class CreateGroup extends StatefulWidget {
  CreateGroup({Key key, this.title}) : super(key: key);
  final String title; // final keyword b/c title is in sub widget

  @override
  // Creates the stateful widget HomePage
  _CreateGroupFormState createState() => _CreateGroupFormState();
}

class _CreateGroupFormState extends State<CreateGroup> {
  final _formKey = GlobalKey<FormState>();
  final timeFormat = DateFormat("h:mm a");
  final _db = GroupProvider();
  TimeOfDay _selectedTime;
  String groupName;
  String day;
  String location;
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

  bool validateForm() {
    final _form = _formKey.currentState;
    if (_form.validate()) {
      _form.save();
      return true;
    }
    return false;
  }

  Future<void> saveGroupToDb() async {
    if (validateForm()) {
      // Save group to db
      Group newGroup = Group(
          name: groupName,
          meetDay: day,
          startTime: _timeValue.text,
          maxMembers: 4);
      dynamic result = _db.createGroup(newGroup);
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
              child: Form(
                key: _formKey,
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
                      onSaved: (value) {
                        groupName = value;
                      },
                      validator: (value) =>
                          value == null ? "Please enter a group name" : null,
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
                          labelText: 'Day'),
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
                        onPressed: saveGroupToDb,
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
            ),
          )
        ],
      ),
    );
  }
}
