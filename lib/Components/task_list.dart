import 'package:flutter/material.dart';
import 'package:todoey/Components/task_tile.dart';
import 'package:todoey/model/task.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;

  TaskList({required this.tasks});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  //from stateful to here so now we don't have to use widget.tasks to access it
  // List<Task> tasks = [
  //   Task(name: 'Bla'),
  //   Task(name: 'Aloo'),
  // ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          name: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          checkboxCallback: (value) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
        );
      },
    );
  }
}
