import 'package:flutter/foundation.dart';
import 'package:ese_app_web/model/objects/Task.dart';

/// Semplice "Model" basato su ChangeNotifier (senza provider).
/// Lo istanziamo in main.dart e lo passiamo a HomePage.
class Model extends ChangeNotifier {
  final List<Task> _tasks = <Task>[];

  List<Task> get tasks => List.unmodifiable(_tasks);

  void addTask(String title, {DateTime? dueDate, int priority = 2}) {
    if (title.trim().isEmpty) return;
    final task = Task(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title.trim(),
      dueDate: dueDate,
      priority: priority,
    );
    _tasks.insert(0, task);
    notifyListeners();
  }

  void toggleTask(String id) {
    final index = _tasks.indexWhere((t) => t.id == id);
    if (index == -1) return;
    _tasks[index] = _tasks[index].toggle();
    notifyListeners();
  }

  void removeTask(String id) {
    _tasks.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  void clearAll() {
    _tasks.clear();
    notifyListeners();
  }

  // Facoltativo: ordinamento per priorità o data
  void sortByPriority() {
    _tasks.sort((a, b) => a.priority.compareTo(b.priority));
    notifyListeners();
  }

  void sortByDueDate() {
    _tasks.sort((a, b) {
      final ad = a.dueDate?.millisecondsSinceEpoch ?? 1 << 30;
      final bd = b.dueDate?.millisecondsSinceEpoch ?? 1 << 30;
      return ad.compareTo(bd);
    });
    notifyListeners();
  }
}
