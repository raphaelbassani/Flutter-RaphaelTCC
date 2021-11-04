class Task{
  int? id;
  String? task;

  Task({required this.id, required this.task});

  Map<String,dynamic> toMap() {
    var map = <String,dynamic> {
      'id': id,
      'task': task,
    };
    return map;
  }

  Task.fromMap(Map<String,dynamic> map) {
    this.id = map['id'];
    this.task = map['task'];
  }

  @override
  String toString() {
    return "Party => (id: $id, task: $task)";
  }
}