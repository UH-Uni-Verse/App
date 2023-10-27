import 'class_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The data associated with each garden.
class UserData {
  UserData(
      {required this.id,
        required this.name,
        required this.major,
        required this.email,
        required this.imagePath,
        List<String>? editorIDs,
        List<String>? viewerIDs})
      : editorIDs = editorIDs ?? [],
        viewerIDs = viewerIDs ?? [];

  String id;
  String name;
  String major;
  String imagePath;
  String email;
  List<String> editorIDs;
  List<String> viewerIDs;
}

/// Provides access to and operations on all defined Gardens.
class UserDB {
  final List<UserData> _users = [
    UserData(
        id: 'user-001',
        name: 'Zachary Thompson',
        major: '19 beds, 162 plantings (2022)',
        imagePath: 'assets/images/garden-001.jpg',
        email: 'zp6@hawaii.edu',
        editorIDs: ['user-002'],
        viewerIDs: ['user-003', 'user-005']),
    UserData(
        id: 'garden-002',
        name: 'Kale is for Kids',
        major: '17 beds, 149 plantings (2022)',
        imagePath: 'assets/images/garden-002.jpg',
        email: 'user-002',
        viewerIDs: ['user-001', 'user-005']),
    UserData(
        id: 'garden-003',
        name: 'Kaimake Loop',
        major: '1 beds, 5 plantings (2022)',
        imagePath: 'assets/images/garden-003.jpg',
        email: 'user-004',
        viewerIDs: ['user-005'],
        editorIDs: ['user-003'])
  ];

  UserData getUser(String userID) {
    return _users.firstWhere((data) => data.id == userID);

  }

  List<String> getUserIDs() {
    return _users.map((data) => data.id).toList();
  }

  List<String> getAssociatedUserIDs({String? userID, String? chapterID}) {
    if (userID != null) {
      return getUserIDs()
          .where((userID) => _userIsAssociated(userID, userID))
          .toList();
    }
    // if (chapterID != null) {
    //   return getUserIDs()
    //       .where((userID) => getUser(userID).chapterID == chapterID)
    //       .toList();
    // }
    return [];
  }
  bool _userIsAssociated(String gardenID, String userID) {
    UserData data = getUser(gardenID);
    return ((data.email == userID) ||
        (data.viewerIDs.contains(userID)) ||
        (data.editorIDs.contains(userID)));
  }

  UserData getOwner(String userID) {
    UserData data = getUser(userID);
    return userDB.getUser(data.email);
  }

//   ClassData getClass(String userID) {
//     UserData data = getUser(userID);
//     return classDB.getChapter(data.chapterID);
//   }
  }

/// The singleton instance of a gardenDB used by clients to access garden data.
UserDB userDB = UserDB();
