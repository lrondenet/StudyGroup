import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:study_group_app/models/message.dart';
import 'package:study_group_app/models/user.dart';
import 'package:study_group_app/screens/groups/group_message.dart';
import 'package:study_group_app/services/user_service.dart';

import '../../models/groups.dart';
import '../../services/message_service.dart';

class GroupDetail extends StatefulWidget {
  final Group group;
  final Color bgColor;
  final Color textColor;

  @override
  _GroupDetailState createState() => _GroupDetailState();

  GroupDetail({this.group, this.bgColor, this.textColor});
}

class _GroupDetailState extends State<GroupDetail> {
  Container aboutPage() {
    return Container(
        constraints: BoxConstraints.expand(),
        color: widget.bgColor,
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 32.0),
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                child: Image.network(
                  'https://www.healthcareisrael.com/images/services/students-ema-care.jpg',
                  fit: BoxFit.cover,
                  height: 200.0,
                ),
                constraints: BoxConstraints.expand(height: 200.0),
              ),
              Container(
                margin: EdgeInsets.only(top: 110.0),
                height: 110.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.transparent,
                      widget.bgColor,
                    ],
                    stops: [0.0, 0.9],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(0.0, 1.0),
                  ),
                ),
              ),
            ]),
            Container(
              child: Column(
                children: <Widget>[
                  cardText('Day of session:'.toUpperCase(), widget.textColor),
                  cardText('${widget.group.day}\n', widget.textColor),
                  cardText('Time of session:'.toUpperCase(), widget.textColor),
                  cardText(
                      '${widget.group.startTime} - ${widget.group.endTime}\n',
                      widget.textColor),
                  cardText('Course ID:'.toUpperCase(), widget.textColor),
                  cardText('${widget.group.id}\n', widget.textColor),
                  cardText('Max Members:'.toUpperCase(), widget.textColor),
                  cardText('${widget.group.maxMembers}\n', widget.textColor),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<List<Message>>.value(
            value: MessageService(groupId: widget.group.id).groupMessages),
        StreamProvider<User>.value(value: UserService().userData)
      ],
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('${widget.group.name}'),
              bottom: TabBar(tabs: [
                Tab(text: 'About'),
                Tab(text: 'Discussion'),
              ]),
            ),
            body: TabBarView(children: [
              aboutPage(),
              GroupMessage(groupId: widget.group.id)
            ]),
          ),
        ),
      ),
    );
  }
}

cardText(String str, Color textColor) => Row(
      children: <Widget>[
        Expanded(
          child: Align(
            child: Text(str,
                style: TextStyle(
                  fontSize: 20,
                  color: textColor,
                )),
          ),
        )
      ],
    );
