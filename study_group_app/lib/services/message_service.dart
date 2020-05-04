import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/message.dart';

class MessageService {
  String groupId;

  MessageService({this.groupId});
  final CollectionReference _msgCollection =
      Firestore.instance.collection('messages');

  // Maps the snapshots from Firebase to a list of Groups
  List<Message> _msgFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Message.fromMap(doc.data);
    }).toList();
  }

  // Provides the stream of Group data to the app
  Stream<List<Message>> get groupMessages {
    return _msgCollection
        .where('groupId', isEqualTo: groupId)
        .snapshots()
        .map(_msgFromSnapshot);
  }
}
