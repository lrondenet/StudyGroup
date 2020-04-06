import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_group_app/models/groups.dart';

class UserStudyGroup {
  final int studyGrpId;
  final int userId;

  UserStudyGroup(this.studyGrpId, this.userId);
}

class GroupProvider {
  final CollectionReference _groupCollection =
      Firestore.instance.collection('userGroups');

  // Singleton instance that will be used outside of this class
  static final GroupProvider instance = GroupProvider._();

  // List<Group> _groups = List<Group>();
  // List<UserStudyGroup> _userGroups = List<UserStudyGroup>();

  GroupProvider._();
  Future<QuerySnapshot> getGroups(String userId) async {
    return _groupCollection
        .where('groupMembers', arrayContains: userId)
        .getDocuments();
  }

  // UserStudyGroup(studyGrpId, userId)

}
