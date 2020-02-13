class Task {
  int id;
  String title;
  int status;

  Task({this.title, this.status});
  Task.withID({this.id, this.title, this.status});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['item'] = title;
    map['status'] = status;
    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task.withID(
        id: map['id'], title: map['item'], status: map['status']);
  }
}
