import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList({required this.tasks});

  final List<String> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tasks[index]),
          trailing: Checkbox(
            value: false,
            onChanged: null,
          ),
        );
      },
    );
  }
}
