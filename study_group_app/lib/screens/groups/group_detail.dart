import 'package:flutter/material.dart';
import 'package:study_group_app/models/groups.dart';

class GroupDetail extends StatelessWidget {
  final Group group;
  final Color bgColor;
  final Color textColor;

  Container aboutPage() => Container(
      constraints: BoxConstraints.expand(),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      //color: bgColor,
      child: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: Image.asset('images/pic.png'),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding:EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: Colors.white,
            ),
            child: Container (
              child: Column(
                children: <Widget> [
                  
                  Text(
                    'DAY OF SESSION:  ${group.day}\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'TIME OF SESSION: ${group.startTime} - ${group.endTime}\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'COURSE ID: ${group.id}\n',
                     style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'MAX MEMBERS: ${group.maxMembers}\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )
                ]
              ),
            ),
          )
          // Container(
          //   child: Column(
          //     children: <Widget>[
          //       cardText('Day of session:'.toUpperCase(), textColor), 
          //       cardText('${group.day}\n', textColor),
          //       cardText('Time of session:'.toUpperCase(), textColor),
          //       cardText('${group.startTime} - ${group.endTime}\n', textColor),
          //       cardText('Course ID:'.toUpperCase(), textColor),
          //       cardText('${group.id}\n', textColor),
          //       cardText('Max Members:'.toUpperCase(), textColor),
          //       cardText('${group.maxMembers}\n', textColor),
          //     ],
          //   ),
          // ),
        ],
      )
    );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('${group.name}'),
          bottom: TabBar(tabs: [
            Tab(text: 'About'),
            Tab(text: 'Discussion'),
          ]),
        ),
        body: TabBarView(children: [aboutPage(), aboutPage()]),
        backgroundColor: Color(0xFF98c1d9),
      ),
    );
  }

  GroupDetail({this.group, this.bgColor, this.textColor});
}

Row cardText(String str, Color textColor) => Row(
      children: <Widget>[
        Expanded(
          child: Align(
            child: Text(str,
                style: TextStyle(
                  fontSize: 20,
                  //color: textColor,
                )),
          ),
        )
      ],
    );
