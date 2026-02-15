import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/models/task.dart';
import 'package:uuid/uuid.dart';

class TaskProvider with ChangeNotifier {
  // final List<Task> _tasks = [];
  final Box<Task> _taskBox = Hive.box<Task>('tasks');
  final Uuid _uuid = const Uuid();

  // List<Task> get tasks => [..._tasks];

  TaskProvider() {
    _initHive();
  }

  Future<void> _initHive() async{
    notifyListeners();
}

List<Task> get tasks => _taskBox.values.toList();

  void addTask(String title, {String description = ''}){
    final newTask = Task(id: _uuid.v4(), title: title, description : description);
    // _tasks.add(newTask);
    _taskBox.put(newTask.id, newTask);
    notifyListeners();
  }

  void toggleTaskCompletion(String id){
    // final index = _tasks.indexWhere((task) => task.id == id);
    final task = _taskBox.get(id);
    if(task != null){
      task.toggleCompletetion();
      notifyListeners();
    }
  }

  void deleteTask(String id){
    _taskBox.delete(id);
    notifyListeners();
  }



}