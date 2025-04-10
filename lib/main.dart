import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/home_screen.dart';

void main() async {
  //Initialize Hive

  await Hive.initFlutter();

  // open a box

  await Hive.openBox("myBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: Colors.amber),
        scaffoldBackgroundColor: Colors.amber[100],
        appBarTheme: const AppBarTheme(backgroundColor: Colors.amber),
      ),
      title: 'To Do App',
      home: const HomeScreen(),
    );
  }
}
