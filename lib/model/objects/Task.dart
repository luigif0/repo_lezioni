/// Entità Task semplice, con utilità base.
class Task {
  final String id;
  final String title;
  final bool isDone;
  final DateTime? dueDate;
  final int priority; // 1 (alta) .. 3 (bassa) – opzionale

  const Task({
    required this.id,
    required this.title,
    this.isDone = false,
    this.dueDate,
    this.priority = 2,
  });

  Task copyWith({
    String? id,
    String? title,
    bool? isDone,
    DateTime? dueDate,
    int? priority,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      dueDate: dueDate ?? this.dueDate,
      priority: priority ?? this.priority,
    );
  }

  Task toggle() => copyWith(isDone: !isDone);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
      'dueDate': dueDate?.toIso8601String(),
      'priority': priority,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      isDone: map['isDone'] as bool? ?? false,
      dueDate: map['dueDate'] != null
          ? DateTime.tryParse(map['dueDate'] as String)
          : null,
      priority: map['priority'] as int? ?? 2,
    );
  }
}
