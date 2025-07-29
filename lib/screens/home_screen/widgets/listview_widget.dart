import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:student_recorder_getx/controller/student_controller.dart';
import 'package:student_recorder_getx/screens/student_profile/student_profile.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _studentController = Get.find<StudentController>();

    return Obx(() {
      return ListView.builder(
        itemCount: _studentController.students.length,
        itemBuilder: (context, index) {
          final student = _studentController.students[index];
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
