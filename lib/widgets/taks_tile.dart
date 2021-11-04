import 'package:flutter/material.dart';
import 'package:raphael_tcc/controllers/helpers.dart';
import 'package:raphael_tcc/models/task.dart';
import 'package:raphael_tcc/view_models/task_view_model.dart';

import 'default_button.dart';

class TaskTile extends StatelessWidget {
  final Task currentTask;
  final TaskViewModel taskViewModel;

  const TaskTile(
      {Key? key, required this.currentTask, required this.taskViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 35, right: 35),
      height: 50,
      child: Row(
        children: [
          Text(
            currentTask.task!,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Spacer(),
          DefaultButton(
            icon: Icons.delete,
            onPressed: () => TaskHelper.showDeleteConfirmAlertDialog(
              context: context,
              taskViewModel: taskViewModel,
              currentTask: currentTask,
            ),
          ),
        ],
      ),
    );
  }
}
