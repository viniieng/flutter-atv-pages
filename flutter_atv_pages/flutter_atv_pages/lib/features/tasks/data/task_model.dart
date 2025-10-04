class Task {
  final int? id;
  final String title;
  final bool done;
  Task({this.id, required this.title, this.done = false});

  Map<String, dynamic> toMap() => {'id': id, 'title': title, 'done': done ? 1 : 0};
  factory Task.fromMap(Map<String, dynamic> m) =>
      Task(id: m['id'] as int?, title: m['title'] as String, done: (m['done'] as int)==1);
}
