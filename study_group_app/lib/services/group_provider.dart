import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_group_app/models/groups.dart';

class GroupProvider {
  final String userUid;

  GroupProvider({this.userUid});
  final CollectionReference _groupCollection =
      Firestore.instance.collection('userGroups');

  // Singleton instance that will be used outside of this class
  // static final GroupProvider instance = GroupProvider._();

  // GroupProvider._();
  Future<QuerySnapshot> getGroups(String userId) async {
    return _groupCollection
        .where('groupIds', arrayContains: userId)
        .getDocuments();
  }

  Stream<QuerySnapshot> get groups {
    return _groupCollection
        .where('groupIds', arrayContains: userUid)
        .snapshots();
  }

  // UserStudyGroup(studyGrpId, userId)

}
