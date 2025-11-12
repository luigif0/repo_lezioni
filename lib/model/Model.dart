import 'package:esempiotodo/model/objects/Task.dart';



class Model {
  static Model sharedInstance = Model();

  List<Task> tasks = [Task("aaa")];

  List<Task> getTasks() {
    return tasks;
  }

  void addTask(Task task) {
    tasks.add(task);
  }


}