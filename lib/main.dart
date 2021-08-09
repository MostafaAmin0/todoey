import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Screens/task_screen.dart';
import 'model/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
