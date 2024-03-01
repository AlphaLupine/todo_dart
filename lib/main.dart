import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {

  //Init hive
  await Hive.initFlutter();
  
  var box = await Hive.openBox('Tasks');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primaryColor: Colors.purple).copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple[600]
        )
      ),
    );
  }
}
