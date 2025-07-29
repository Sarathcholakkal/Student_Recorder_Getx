import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_recorder_getx/controller/student_controller.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _studentController = Get.find<StudentController>();

    return Obx(() {
      final students = _studentController.currentList;

      if (_studentController.isSearching == true &&
          _studentController.noItemFound == true) {
        return Center(child: Text('NO item found'));
      }
      return ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return GestureDetector(
            onDoubleTap: () {
              Get.toNamed('/studentProfile', arguments: {'student': student});
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  backgroundImage: student.image != null
                      ? FileImage(File(student.image))
                      : const AssetImage("assets/male.jpg") as ImageProvider,
                ),
                title: Text(student.name),
                subtitle: Text(student.subject),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
