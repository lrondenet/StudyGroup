class Group {
  int id;
  String name;

  Group(this.id, this.name);
}

class GroupProvider {
  List<Group> _groups;
  GroupProvider._() {
    if (_groups == null) {
      _groups.add(new Group(0, 'Fluffy Bunnies'));
      _groups.add(new Group(1, 'Best Group'));
      _groups.add(new Group(2, 'Other Best Group'));
    }
  }
  // Singleton instance that will be used outside of this class
  static final GroupProvider instance = GroupProvider._();

  Future<List<Group>> getAllGroups() async {
    return _groups;
  }
}

class UserStudyGroup {
  final int studyGrpId;
  final int userId;

  UserStudyGroup(this.studyGrpId, this.userId);
}

class UserGroupsProvider {
//  List<UserStudyGroup>
}
