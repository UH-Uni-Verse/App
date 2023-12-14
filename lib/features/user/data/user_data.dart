import 'package:app/features/class/data/class_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<UserData> _users = [];

class UserData {
  UserData({
    required this.id,
    required this.name,
    required this.major,
    required this.email,
    required this.interests,
    required this.classes,
    required this.imagePath,
    List<String>? editorIDs,
    List<String>? viewerIDs,
  })  : editorIDs = editorIDs ?? [],
        viewerIDs = viewerIDs ?? [];

  String id;
  String name;
  String major;
  String imagePath;
  String email;
  String interests;
  String classes;
  List<String> editorIDs;
  List<String> viewerIDs;



  // static UserData getUserByName(String userName) {
  //   return _users.firstWhere((data) => data.name == userName);
  // }
}


/// Provides access to and operations on all defined Gardens.
class UserDB {
  final List<UserData> _users = [
    UserData(
        id: '001',
        name: 'Zachary Thompson',
        major: 'Computer Science',
        imagePath: 'assets/images/default-profile.jpg',
        email: 'zp6@hawaii.edu',
        interests: 'Volleyball, Basketball, Surfing, Coding, Gaming',
        classes: 'ICS 691, ICS 110P, ECON 101',
        editorIDs: ['user-002'],
        viewerIDs: ['user-003', 'user-005']),
    UserData(
        id: '002',
        name: 'Sally Fletcher',
        major: 'Finance',
        imagePath: 'assets/images/default-profile.jpg',
        email: 'sf5@hawaii.edu',
        interests: 'Painting, Lifting, Running',
        classes: 'ACC 200, ACC 399, JOUR 150',
        viewerIDs: ['user-001', 'user-005']),
    UserData(
        id: '003',
        name: 'Dewey Price',
        major: 'Kinesiology',
        imagePath: 'assets/images/default-profile.jpg',
        email: 'dp9@hawaii.edu',
        interests: 'Basketball, Pickle ball, Snorkeling',
        classes: 'KRS 101, KRS 151, SPAN 101',
        viewerIDs: ['user-005'],
        editorIDs: ['user-003']),
    UserData(
        id: '004',
        name: 'Jeff Hernandez',
        major: 'Biology',
        imagePath: 'assets/images/default-profile.jpg',
        email: 'JH1@hawaii.edu',
        interests: 'Gaming, Collecting, Making Music',
        classes: 'BIOL 101, BIOL 301, MBIO 600',
        viewerIDs: ['user-005'],
        editorIDs: ['user-003']),
    UserData(
        id: '005',
        name: 'Rachel Johnson',
        major: 'Business',
        imagePath: 'assets/images/default-profile.jpg',
        email: 'RJ7@hawaii.edu',
        interests: 'Photography, Videography, Fishing',
        classes: 'BUS 099, BUS 310, BLAW 200',
        viewerIDs: ['user-005'],
        editorIDs: ['user-003'])
  ];

  String getUserIDByName(String userName) {
    UserData user = _users.firstWhere(
          (user) => user.name == userName
    );
    return user.id;
  }

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
}

UserDB userDB = UserDB();