class User {
  final String uid;
  User({this.uid});
}

class UserData {
  final String uid;
  final String email;
  final String userName;
  final String firstName;
  final String lastName;
  var groups;

  UserData(
      {this.uid,
      this.email,
      this.userName,
      this.firstName,
      this.lastName,
      this.groups});

  factory UserData.fromMap(Map data) {
    return UserData(
      email: data['email'] ?? '',
      userName: data['userName'] ?? '',
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      groups: data['groups'] ?? '',
    );
  }
}
