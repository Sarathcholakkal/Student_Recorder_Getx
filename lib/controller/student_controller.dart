import 'package:get/get.dart';
import 'package:student_recorder_getx/db/db_servies.dart';
import 'package:student_recorder_getx/model/student.dart';

class StudentController extends GetxController {
  RxList<Student> students = <Student>[].obs;
  RxList<Student> filteredStudents = <Student>[].obs;
  RxBool isSearching = false.obs;
  RxBool noItemFound = false.obs;
  List<Student> get currentList =>
      isSearching.value ? filteredStudents : students;

  @override
  void onInit() {
    super.onInit();
    loadInitialStudents();
  }

  void loadInitialStudents() {
    // this functions used to load inital student
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    final result = await DBService.getAllStudents();
    students.value = result;
    filteredStudents.value = List.from(result);
  }

  /// Add a student
  Future<void> addStudent(Student student) async {
    await DBService.addStudent(student);
    await fetchStudents();
  }

  /// Delete a student
  Future<void> deleteStudent(int id) async {
    await DBService.deleteStudent(id);
    await fetchStudents();
  }

  /// Update a student
  Future<void> updateStudent(Student updatedStudent) async {
    await DBService.updateStudent(updatedStudent);
    await fetchStudents();
  }

  void searchStudents(String query) {
    if (query.isEmpty) {
      isSearching.value = false;
      noItemFound.value = false;
      filteredStudents.value = List.from(
        students,
      ); // used to populate filter list ,when user not entered any qurey ,but still in search mode
    } else {
      isSearching.value = true;

      filteredStudents.value = students
          .where(
            (student) =>
                student.name.toLowerCase().contains(query.toLowerCase()) ||
                student.subject.toLowerCase().contains(
                  query.toLowerCase(),
                ), // enable double searching ,can able to search user based on name and subject
          )
          .toList();

      noItemFound.value = filteredStudents.isEmpty;
    }
  }
}




















  /// Fetch all students




  // /// Search functionality
