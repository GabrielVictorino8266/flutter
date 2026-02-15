import 'package:flutter/material.dart';
import 'package:todo_app/providers/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/task_item.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Tarefas'),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child){
          if(taskProvider.tasks.isEmpty){
            return const Center(child: Text('Sem tarefas'));
          }
          return ListView.builder(
            itemCount: taskProvider.tasks.length,
            itemBuilder: (context, index) {
              final task = taskProvider.tasks[index];
              return TaskListItem(
                task: task,
                onToggle: (_) => taskProvider.toggleTaskCompletion(task.id),
                onDelete: () => taskProvider.deleteTask(task.id),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Provider.of<TaskProvider>(context, listen:false)
        .addTask('Nova Tarefa ${DateTime.now().second}');
      },
      child: const Icon(Icons.add),),
    );
  }
}