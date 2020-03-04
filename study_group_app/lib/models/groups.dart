import 'user.dart';

class Group {
  int id;
  String name;
  int members;
  String meetDay;
  String timeBlock;

  Group(this.id, this.name, this.members, this.meetDay, this.timeBlock);
}

class UserStudyGroup {
  final int studyGrpId;
  final int userId;

  UserStudyGroup(this.studyGrpId, this.userId);
}

class GroupProvider {
  List<Group> _groups = new List<Group>();
  List<UserStudyGroup> _userGroups = List<UserStudyGroup>();

  GroupProvider._() {
    if (_groups.isEmpty) {
      _groups.add(new Group(0, 'Fluffy Bunnies', 4, 'Monday', '3-5pm'));
      _groups.add(new Group(1, 'Best Group', 3, 'Wednesday', '2-3pm'));
      _groups.add(new Group(2, 'Other Best Group', 2, 'Friday', '5-8pm'));
    }
    // UserStudyGroup(studyGrpId, userId)
    if (_userGroups.isEmpty) {
      _userGroups.add(new UserStudyGroup(0, 0));
      _userGroups.add(new UserStudyGroup(0, 1));
      _userGroups.add(new UserStudyGroup(0, 2));
      _userGroups.add(new UserStudyGroup(0, 3));

      _userGroups.add(new UserStudyGroup(1, 1));
      _userGroups.add(new UserStudyGroup(1, 0));
      _userGroups.add(new UserStudyGroup(1, 4));

      _userGroups.add(new UserStudyGroup(2, 0));
      _userGroups.add(new UserStudyGroup(2, 2));
    }
  }

  // Singleton instance that will be used outside of this class
  static final GroupProvider instance = GroupProvider._();

  List<Group> getGroupsById(int userId) {
    List<Group> grpList = new List<Group>();
    List<UserStudyGroup> userGroups = getUserGroups(userId);
    for (var userGrp in userGroups) {
      for (var grp in _groups) {
        if (userGrp.studyGrpId == grp.id) {
          grpList.add(grp);
        }
      }
    }
    return grpList;
  }

  List<UserStudyGroup> getUserGroups(usrId) {
    List<UserStudyGroup> userGroups = new List<UserStudyGroup>();
    for (var userGrp in _userGroups) {
      if (userGrp.userId == usrId) {
        userGroups.add(userGrp);
      }
    }
    return userGroups;
  }
}
