import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  final Function addTaskCallback;

  const AddTask({required this.addTaskCallback});


  @override
  Widget build(BuildContext context) {
    String? newTask;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 20.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                newTask = value;
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                    (state) => Colors.lightBlueAccent),
              ),
              child: Text(
                'ADD',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: (){
                addTaskCallback(newTask);
              },
            ),
          ],
        ),
      ),
    );
  }
}
