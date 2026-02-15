import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:uuid/uuid.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];
  final Uuid _uuid = const Uuid();

  List<Task> get tasks => [..._tasks];

  void addTask(String title, {String description = ''}){
    final newTask = Task(id: _uuid.v4(), title: title, description : description);
    _tasks.add(newTask);
    notifyListeners();
  }

  void toggleTaskCompletion(String id){
    final index = _tasks.indexWhere((task) => task.id == id);
    if(index != -1){
      _tasks[index].toggleCompletetion();
      notifyListeners();
    }
  }

  void deleteTask(String id){
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }



}