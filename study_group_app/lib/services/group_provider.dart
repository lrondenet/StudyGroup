import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_group_app/models/groups.dart';

class GroupProvider {
  final String userUid;

  GroupProvider({this.userUid});
  final CollectionReference _groupCollection =
      Firestore.instance.collection('userGroups');

  // Maps the snapshots from Firebase to a list of Groups
  List<Group> _grpFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Group.fromMap(doc.data);
    }).toList();
  }

  // Provides the stream of Group data to the app
  Stream<List<Group>> get groupData {
    return _groupCollection
        .where('memberIds', arrayContains: userUid)
        .snapshots()
        .map(_grpFromSnapshot);
  }

  Future createGroup(Group newGrp) async {
    try {
      dynamic result = _groupCollection.add(newGrp.toMap());
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
