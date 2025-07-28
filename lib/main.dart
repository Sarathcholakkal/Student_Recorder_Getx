import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:student_recorder_getx/flash_screen.dart';
import 'package:student_recorder_getx/screens/form_screen/form_screen.dart';
import 'package:student_recorder_getx/screens/form_screen/update_screen.dart';
import 'package:student_recorder_getx/screens/home_screen/home_screen.dart';
import 'package:student_recorder_getx/screens/student_profile/student_profile.dart';
import 'package:student_recorder_getx/utils/curstom_theme.dart';

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
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Flash_Screen()),
        GetPage(name: '/homeScreen', page: () => HomeScreen()),
        GetPage(name: '/studentProfile', page: () => StudentProfile()),
        GetPage(name: '/updateScreen', page: () => UpdateScreen()),
        GetPage(name: '/formScreen', page: () => FormScreen()),
      ],

      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Flash_Screen(),
    );
  }
}
