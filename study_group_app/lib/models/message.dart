import 'package:study_group_app/models/user.dart';

class Message {
  final String userEmail;
  final String time;
  final String text;
  final String groupId;
  final String userId;

  Message({this.userEmail, this.time, this.text, this.groupId, this.userId});

  factory Message.fromMap(Map map) {
    return Message(
      userEmail: map['userEmail'] ?? '',
      time: map['time'] ?? '',
      text: map['text'] ?? '',
      groupId: map['groupId'] ?? '',
      userId: map['userId'] ?? '',
    );
  }
}
