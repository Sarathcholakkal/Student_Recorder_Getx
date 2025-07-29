import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_recorder_getx/controller/student_controller.dart';

class GridViewWidget extends StatelessWidget {
  final _studentController = Get.find<StudentController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final students = _studentController.currentList;

      if (_studentController.isSearching == true &&
          _studentController.noItemFound == true) {
        return Center(child: Text('NO item found'));
      }

      return GridView.builder(
        itemCount: students.length,
        itemBuilder: (ctx, index) {
          final student = students[index];
          return GestureDetector(
            onDoubleTap: () {
              Get.toNamed('/studentProfile', arguments: {'student': student});
            },
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: student.image != null
                              ? FileImage(File(student.image))
                              : const AssetImage("assets/female.jpg")
                                    as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(student.name, style: const TextStyle(fontSize: 20)),
                  Text(student.subject, style: TextStyle()),
                  SizedBox(height: 5),
                ],
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        padding: const EdgeInsets.all(5),
      );
    });
  }
}
