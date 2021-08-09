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
    return ListView.builder(
      itemCount: context.read<TaskData>().taskLenght,
      itemBuilder: (context, index) {
        return TaskTile(
          name: context.read<TaskData>().taskList[index].name,
          isChecked: context.read<TaskData>().taskList[index].isDone,
          checkboxCallback: (value) {
            context.read<TaskData>().updateTask(context.read<TaskData>().taskList[index]);
          },
        );
      },
    );
  }
}
