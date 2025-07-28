import 'package:flutter/material.dart';
import 'package:student_recorder_getx/screens/student_profile/student_profile.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        // final student = newList[index];
        return GestureDetector(
          onDoubleTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => StudentProfile()));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 40,
                backgroundImage:
                    // student.image != null
                    //     ? FileImage(File(student.image)):
                    const AssetImage("assets/male.jpg") as ImageProvider,
              ),
              title: Text('Shanidha ps'),
              subtitle: Text('Computer Sceince'),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward),
              ),
            ),
          ),
        );
      },
    );
  }
}
