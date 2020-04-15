class User {
  final int id;
  final String name;

  User({
    this.id,
    this.name
  });
}

class Message {
  final User sender;
  final String time;
  final String text;

  Message({
    this.sender,
    this.time,
    this.text
  });
}

