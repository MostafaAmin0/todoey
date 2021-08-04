import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  const TaskList({required this.tasks});

  final List<String> tasks;

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  bool checkState = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            widget.tasks[index],
            style: TextStyle(
              decoration: checkState ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: TaskCheckbox(
            isChecked: checkState,
            checkboxCallback: (checkboxState) {
              setState(() {
                checkState = checkboxState!;
              });
            },
          ),
        );
      },
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  const TaskCheckbox({this.isChecked: false, required this.checkboxCallback});
  final bool isChecked;
  final Function(bool?)? checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      activeColor: Colors.lightBlueAccent,
      onChanged: checkboxCallback,
    );
  }
}
