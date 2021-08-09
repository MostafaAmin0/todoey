import 'package:flutter/material.dart';
import 'package:todoey/Components/task_tile.dart';
import 'package:provider/provider.dart';
import '../model/task_data.dart';

class TaskList extends StatelessWidget {
  //from stateful to here so now we don't have to use widget.tasks to access it
  // List<Task> tasks = [
  //   Task(name: 'Bla'),
  //   Task(name: 'Aloo'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemCount: taskData.taskLenght,
        itemBuilder: (context, index) {
          final task = taskData.taskList[index];
          return TaskTile(
            name: task.name,
            isChecked: task.isDone,
            checkboxCallback: (value) {
              taskData.updateTask(task);
            },
            longPress: () {
              taskData.removeTask(task);
            },
          );
        },
      );
    });
  }
}
