import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class TaskListItem extends StatelessWidget{
  final Task task;
  final ValueChanged<Task> onToggle;
  final VoidCallback onDelete;

  const TaskListItem({
    Key? key,
    required this.task,
    required this.onToggle,
    required this.onDelete
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 0.8, horizontal: 16.0),
      elevation: 2,
      child: ListTile(
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (_) =>   onToggle(task),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: task.description.isNotEmpty ? Text(
          task.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ) : null,
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: onDelete,
        ),
        onTap: () => onToggle(task),
      )
    );
  }

}