import 'package:flutter/material.dart';
import 'package:todo_app/providers/task_provider.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'models/task.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());

  await Hive.openBox<Task>('tasks');

  runApp(const MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: const HomeScreen(),
      ),
    );
  }




}