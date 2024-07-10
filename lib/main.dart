import 'package:flutter/material.dart';
import './pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async {
  await Hive.initFlutter();
  // ignore: unused_local_variable
  var box =await Hive.openBox('TODOBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.orange[300],
        ),
      ),
      home: const HomePage(),
    );
  }
}
