import 'package:flutter/material.dart';
import 'package:student_recorder_getx/screens/home_screen/widgets/gridview_widget.dart';
import 'package:student_recorder_getx/screens/home_screen/widgets/listview_widget.dart';
import 'package:student_recorder_getx/utils/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //   Navigator.of(
          //     context,
          //   ).push(MaterialPageRoute(builder: (context) => FormScreen()));
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
                style: TextStyle(letterSpacing: 1),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.list,

                    // ? Icons.list
                    // : Icons.grid_on,
                  ),
                ),

                // Switch(onChanged: toggleSwitch, value: themeChange.darkTheme),
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
      body: SafeArea(child: ListViewWidget()),
    );
  }
}


  // ? GridViewWidget()
  //                 : ListViewWidget();