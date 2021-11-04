import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:raphael_tcc/controllers/constants.dart';
import 'package:raphael_tcc/controllers/helpers.dart';
import 'package:raphael_tcc/models/task.dart';
import 'package:raphael_tcc/view_models/task_view_model.dart';
import 'package:raphael_tcc/widgets/default_app_bar_title.dart';
import 'package:raphael_tcc/widgets/default_button.dart';
import 'package:raphael_tcc/widgets/default_divider.dart';
import 'package:raphael_tcc/widgets/taks_tile.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<TaskViewModel>().getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    TaskViewModel taskViewModel = context.watch<TaskViewModel>();
    List<Task> tasks = [];
    if (!taskViewModel.isLoadingTasks) {
      tasks = taskViewModel.tasks!;
    }
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: DefaultAppBarTitle(),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: false,
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            DefaultDivider(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskTile(
                    currentTask: tasks[index],
                    taskViewModel: taskViewModel,
                  );
                },
              ),
            ),
            DefaultDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: controller,
                cursorColor: Constants.textColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Novo item",
                  errorBorder: InputBorder.none,
                  suffixIcon: DefaultButton(
                    icon: Icons.edit,
                    size: 20,
                    onPressed: () async {
                      int newIndex = TaskHelper.newTaskIndex(tasks);
                      await taskViewModel.createTask(
                        Task(
                          id: newIndex,
                          task: controller.text,
                        ),
                      );
                      if (taskViewModel.creationError) {
                        TaskHelper.showCreationErrorAlertDialog(context);
                      }
                      controller.clear();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
