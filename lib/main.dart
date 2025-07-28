import 'package:flutter/material.dart';
import 'package:student_recorder_getx/flash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initilaizeDataBase();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dark Theme',
      debugShowCheckedModeBanner: false,
      home: Flash_Screen(),
    );
  }
}
