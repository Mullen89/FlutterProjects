class Task {
  final String name;
  bool isDone;
  int count;
  int id;
  int status;

  Task({this.id, this.name, this.isDone});
  Task.withID({this.id, this.name, this.status});

  void toggleDone() {
    isDone = !isDone;
  }

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['item'] = name;
    map['status'] = isDone;
    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task.withID(id: map['id'], name: map['item'], status: map['status']);
  }
}
