import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String name;
  final Function(bool?)? checkboxCallback;
  final Function()? longPress;

  const TaskTile({this.name: '', this.isChecked: false, this.checkboxCallback,this.longPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress:longPress ,
      title: Text(
        name,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: checkboxCallback,
      ),
    );
  }
}
