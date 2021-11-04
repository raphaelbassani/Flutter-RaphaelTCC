import 'package:flutter/cupertino.dart';
import 'package:raphael_tcc/controllers/database.dart';
import 'package:raphael_tcc/models/task.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task>? tasks;
  DBHelper _db = DBHelper();
  bool isLoadingTasks = true;
  bool creationError = false;

  Future<void> getAllTasks() async {
    await _db.getTasks().then((allTasks) {
      tasks = allTasks;
    });
    isLoadingTasks = false;
    notifyListeners();
  }

  Future<void> createTask(Task task) async {
    bool alreadyExists = false;
    tasks!.forEach((element) {
      if (element.task == task.task) {
        alreadyExists = true;
      }
    });
    if (alreadyExists) {
      creationError = true;
    } else {
      await _db.createTask(task);
      tasks!.add(task);
      creationError = false;
    }
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    await _db.deleteTask(task.id!);
    tasks!.removeWhere((element) => element == task);
    notifyListeners();
  }
}
