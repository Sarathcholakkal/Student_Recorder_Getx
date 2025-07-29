import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:student_recorder_getx/controller/student_controller.dart';
import 'package:student_recorder_getx/model/student.dart';
import 'package:student_recorder_getx/screens/student_profile/info_widget.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments;
    final student = args['student'] as Student;
    final _studentController = Get.find<StudentController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student Profile',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 35),
                  height: 240,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 80,
                        backgroundImage: student.image != null
                            ? FileImage(File(student.image))
                            : const AssetImage("assets/profile.jpg")
                                  as ImageProvider,
                      ),
                      Text(
                        student.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'ID :${student.id!}',
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Details',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),

                      InforTileWidget(label: 'Full Name', value: student.name),
                      InforTileWidget(label: 'Subject', value: student.subject),
                      InforTileWidget(label: 'CGPA', value: student.cgpa),
                      InforTileWidget(
                        label: 'Email ID',
                        value: student.emailID,
                      ),
                      InforTileWidget(
                        label: 'Phone Number',
                        value: student.phoneNumber,
                      ),
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(
                              horizontal: 150,
                              vertical: 5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(
                              '/updateScreen',
                              arguments: {'student': student},
                            );
                          },
                          child: const Text(
                            "Edit",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(
                              horizontal: 150,
                              vertical: 5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () async {
                            showDialog(
                              context: context,
                              builder: (ctx1) {
                                return AlertDialog(
                                  title: const Text(
                                    'Are you sure to delete this profile',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx1).pop();
                                      },
                                      child: const Text('close'),
                                    ),
                                    Spacer(),
                                    TextButton(
                                      onPressed: () async {
                                        final _studentController =
                                            Get.find<StudentController>();
                                        _studentController.deleteStudent(
                                          student.id!,
                                        );

                                        Navigator.of(ctx1).pop();
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('yes'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text(
                            "Delete",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
