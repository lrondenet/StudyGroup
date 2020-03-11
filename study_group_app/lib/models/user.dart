class User {
  User(this.id, this.userName, this.email, this.firstName, this.lastName);

  int id;
  String userName;
  String email;
  String firstName;
  String lastName;
}

class UserProvider {
  // Private contstructor for this class
  List<User> _users;
  UserProvider._() {
    if (_users == null) {
      _users.add(new User(0, 'TestUser', 'email@example.com', 'John', 'Doe'));
      _users.add(new User(1, 'User2', 'user2@example.com', 'Ozzy', 'Osbourne'));
      _users.add(
          new User(2, 'metal_head666', 'metal@example.com', 'Rob', 'Zombie'));
      _users.add(new User(
          3, 'bluesMaster42', 'clapton@awesome.com', 'Eric', 'Clapton'));
    }
  }
  // Singleton instance that will be used outside of this class
  static final UserProvider instance = UserProvider._();

  Future<List<User>> getAllUsers() async {
    return _users;
  }
}
