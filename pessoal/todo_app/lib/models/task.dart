import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    this.isCompleted = false,
    this.description = ''
  });

  void toggleCompletetion(){
    isCompleted = !isCompleted;
  }

  // factory Task.fromJson(Map<String, dynamic> json){
  //   return Task(
  //     id: json['id'],
  //     title: json['title'],
  //     description: json['description'] ?? '',
  //     isCompleted: json['isCompleted'] ?? false
  //   );
  // }
  //
  // Map<String, dynamic> toJson(){
  //   return {
  //     'id': id,
  //     'title': title,
  //     'description': description,
  //     'isCompleted': isCompleted
  //   };
  // }

}