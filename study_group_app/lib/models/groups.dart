// This file is mainly serving as static data for now. Will update to integrate
// Firebase data when that is setup
class Group {
  final int id;
  final String name;
  var members;
  final String meetDay;
  final String time;
  final int maxMembers;

  Group(
      {this.id,
      this.name,
      this.members,
      this.meetDay,
      this.time,
      this.maxMembers});

  factory Group.fromMap(Map data) {
    return Group(
      name: data['name'] ?? '',
      members: data['groupMembers'] ?? '',
      maxMembers: data['maxMembers'] ?? '',
      meetDay: data['day'] ?? '',
      time: data['time'] ?? '',
    );
  }
}
