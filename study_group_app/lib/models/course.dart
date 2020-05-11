class Course {
  final String name;
  final String description;
  final String meetTime;

  Course({this.name, this.description, this.meetTime});

  factory Course.fromMap(Map map) {
    return Course(
      name: map['name'],
      description: map['description'],
      meetTime: map['meetTime'],
    );
  }
}
