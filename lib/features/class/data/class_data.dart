import 'class_data.dart';

final List<UserData2> _classes = [];

class UserData2 {
  UserData2({
    required this.id,
    required this.name,
    required this.professor,
    required this.students,
    required this.description,
    required this.imagePath,
    required this.imagePath2,
    List<String>? editorIDs,
    List<String>? viewerIDs,
  })  : editorIDs = editorIDs ?? [],
        viewerIDs = viewerIDs ?? [];

  String id;
  String name;
  String professor;
  String imagePath;
  String imagePath2;
  String students;
  String description;
  List<String> editorIDs;
  List<String> viewerIDs;

  static UserData2 getUserByName(String userName) {
    return _classes.firstWhere((data) => _containsName(data.students, userName));
  }

  static bool _containsName(String students, String userName) {
    List<String> studentNames = students.split(',').map((name) => name.trim()).toList();
    return studentNames.contains(userName);
  }
}

/// Provides access to and operations on all defined Gardens.
class UserDB2 {
  final List<UserData2> _classes = [
    UserData2(
        id: '001',
        name: 'ICS 691',
        professor: 'Philip Johnson',
        imagePath: 'assets/images/class_icon.png',
        imagePath2: 'assets/images/default-profile.jpg',
        students: 'Zachary Thompson, Sally Fletcher, Dewey Price, Jeff Hernandez, Rachel Johnson',
        description: 'Learn how to use flutter to create your own app. Involves in depth exploration into the app development process.',
        editorIDs: ['user-002'],
        viewerIDs: ['user-003', 'user-005']),
    UserData2(
        id: '002',
        name: 'ICS 110P',
        professor: 'Dave Stevens',
        imagePath: 'assets/images/class_icon.png',
        imagePath2: 'assets/images/default-profile.jpg',
        students: 'Zachary Thompson, Sally Fletcher, Dewey Price, Jeff Hernandez, Rachel Johnson',
        description: 'Learn the basics of coding in python.',
        viewerIDs: ['user-001', 'user-005']),
    UserData2(
        id: '003',
        name: 'ECON 321',
        professor: 'Mustafa Shirzad',
        imagePath: 'assets/images/class_icon.png',
        imagePath2: 'assets/images/default-profile.jpg',
        students: 'Zachary Thompson, Sally Fletcher, Dewey Price, Jeff Hernandez, Rachel Johnson',
        description: 'Learn the basics of statistics.',
        viewerIDs: ['user-005'],
        editorIDs: ['user-003']),
    UserData2(
        id: '004',
        name: 'KRS 137',
        professor: 'Micheal Jordan',
        imagePath: 'assets/images/class_icon.png',
        imagePath2: 'assets/images/default-profile.jpg',
        students: 'Zachary Thompson, Sally Fletcher, Dewey Price, Jeff Hernandez, Rachel Johnson',
        description: 'Learn the fundamentals of basketball.',
        viewerIDs: ['user-005'],
        editorIDs: ['user-003']),

  ];

  UserData2 getUser(String classID) {
    return _classes.firstWhere((data) => data.id == classID);
  }

  List<String> getClassIDs() {
    return _classes.map((data) => data.id).toList();
  }
}

UserDB2 userDB2 = UserDB2();
