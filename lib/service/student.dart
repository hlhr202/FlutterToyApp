import "package:testflutter/model/student.dart";
import "package:rxdart/subjects.dart";
// import 'dart:convert';

class StudentService {
  final subject = PublishSubject<Student>();

  // Try with async fetch
  Future<Student> fetchStudent() async {
    final student = Student.generateRandom();
    return student;
  }

  Future<void> updateStudent() async {
    final student = await fetchStudent();
    subject.sink.add(student);
  }

  void resetStudent() {
    subject.sink.add(null);
  }

  void dispose() {
    subject.close();
  }
}

final studentService = StudentService();