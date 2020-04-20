// This file is mainly serving as static data for now. Will update to integrate
// Firebase data when that is setup
class Group {
  final int id;
  final String name;
  var membersIds;
  final String meetDay;
  final String startTime;
  final String endTime;
  final int maxMembers;

  Group(
      {this.id,
      this.name,
      this.membersIds,
      this.meetDay,
      this.startTime,
      this.endTime,
      this.maxMembers});

  factory Group.fromMap(Map data) {
    return Group(
      name: data['name'] ?? '',
      membersIds: data['memberIds'] ?? '',
      maxMembers: data['maxMembers'] ?? '',
      meetDay: data['day'] ?? '',
      startTime: data['startTime'] ?? '',
      endTime: data['endTime'] ?? '',
    );
  }
  toMap() {
    return {
      "name": name,
      "meetDay": meetDay,
      "startTime": startTime,
      "endTime": '',
      "maxMembers": '',
    };
  }
}
