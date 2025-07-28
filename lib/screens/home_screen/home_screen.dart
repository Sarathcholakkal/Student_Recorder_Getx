import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:student_recorder_getx/controller/screenview_controller.dart';
import 'package:student_recorder_getx/controller/theme_controller.dart';
import 'package:student_recorder_getx/screens/home_screen/widgets/gridview_widget.dart';
import 'package:student_recorder_getx/screens/home_screen/widgets/listview_widget.dart';
import 'package:student_recorder_getx/utils/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ThemeController _themeController = Get.put(ThemeController());
  final ScreenviewController _viewcontroller = Get.put(ScreenviewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/formScreen');
        },
        child: Icon(Icons.add),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "Student Records",
                style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              actions: [
                Obx(
                  () => IconButton(
                    onPressed: () {
                      _viewcontroller.switchView();
                    },
                    icon: Icon(
                      _viewcontroller.currentView.value == true
                          ? Icons.list
                          : Icons.grid_on,
                    ),
                  ),
                ),

                Obx(
                  () => Switch(
                    value:
                        _themeController.currentTheme.value == ThemeMode.dark,
                    onChanged: (value) {
                      _themeController.switchTheme();
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: const TextStyle(fontSize: 16, color: Colors.black38),
                controller: TextEditingController(),
                textAlignVertical: TextAlignVertical.center,
                decoration: searchInputDecoration,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => _viewcontroller.currentView.value == true
              ? GridViewWidget()
              : ListViewWidget(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _themeController.dispose();
    _viewcontroller.dispose();
    super.dispose();
  }
}


  // ? GridViewWidget()
  //                 : ListViewWidget();