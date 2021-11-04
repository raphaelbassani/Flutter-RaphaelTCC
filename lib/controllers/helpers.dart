import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:raphael_tcc/models/name.dart';
import 'package:raphael_tcc/models/task.dart';
import 'package:raphael_tcc/view_models/task_view_model.dart';

class NameHelper {
  static Future<dynamic> getName() async {
    try {
      var response =
          await Dio().get('https://randomuser.me/api/?inc=name&noinfo');
      return Name.fromJson(response.data);
    } catch (e) {}
  }
}

class TaskHelper {
  static newTaskIndex(List<Task> tasks) {
    if (tasks.isEmpty) {
      return 0;
    } else {
      return tasks.last.id! + 1;
    }
  }

  static showCreationErrorAlertDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Item já cadastrado'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  static showDeleteConfirmAlertDialog({
    required BuildContext context,
    required TaskViewModel taskViewModel,
    required Task currentTask,
  }) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Deseja deletar este item'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              taskViewModel.deleteTask(currentTask);
              Navigator.pop(context);
            },
            child: const Text('Deletar'),
          ),
        ],
      ),
    );
  }
}
