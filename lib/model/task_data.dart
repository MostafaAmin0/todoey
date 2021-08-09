import 'dart:io';
import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';
import 'package:path_provider/path_provider.dart';

class TaskData extends ChangeNotifier {
  List<Task> _taskList = [];

  TaskData() {
    readData();
  }

  void addToList(String newTask) {
    _taskList.add(Task(name: newTask));
    saveData();
    notifyListeners();
  }

  int get taskLenght => _taskList.length;

  UnmodifiableListView<Task> get taskList => UnmodifiableListView(_taskList);

  void updateTask(Task task) {
    task.toggleDone();
    saveData();
    notifyListeners();
  }

  void removeTask(Task task) {
    _taskList.remove(task);
    saveData();
    notifyListeners();
  }

  void saveData() async {
    try {
      //finding correct local path
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      //a reference to the file location
      File file = File('$appDocPath/tasksData.txt');
      var sink = file.openWrite(mode: FileMode.write);
      for (var task in _taskList) sink.write('${task.name}\n${task.isDone}\n');
      sink.close();
    } catch (e) {
      print(e);
    }
  }

  void readData() async {
    try {
      //finding correct local path
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      //a reference to the file location
      File file = File('$appDocPath/tasksData.txt');
      bool exists = await file.exists();
      if (exists) {
        List<String> tasksData = await file.readAsLines();
        for (int i = 0; i < tasksData.length; i += 2)
          _taskList.add(
              Task(name: tasksData[i], isDone: (tasksData[i + 1] == 'true')));
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}
