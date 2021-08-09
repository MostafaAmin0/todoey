import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _taskList = [
    Task(name: 'Bla'),
    Task(name: 'Aloo'),
  ];

  void addToList(String newTask){
    _taskList.add(Task(name: newTask));
    print(_taskList);
    notifyListeners();
  }

  int get taskLenght => _taskList.length;

  UnmodifiableListView<Task> get taskList => UnmodifiableListView(_taskList);

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(Task task){
    _taskList.remove(task);
    notifyListeners();
  }

}
