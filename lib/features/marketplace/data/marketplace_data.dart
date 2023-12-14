import 'marketplace_data.dart';

final List<UserData3> _items = [];

class UserData3 {
  UserData3({
    required this.id,
    required this.name,
    required this.price,
    required this.seller,
    required this.description,
    required this.imagePath,
    required this.imagePath2,
    List<String>? editorIDs,
    List<String>? viewerIDs,
  })  : editorIDs = editorIDs ?? [],
        viewerIDs = viewerIDs ?? [];

  String id;
  String name;
  String price;
  String imagePath;
  String imagePath2;
  String seller;
  String description;
  List<String> editorIDs;
  List<String> viewerIDs;
}

class UserDB3 {
  final List<UserData3> _items = [
    UserData3(
      id: '001',
      name: 'Desk',
      price: '50.00',
      imagePath: 'assets/images/default-shopping.png',
      imagePath2: 'assets/images/default-profile.jpg',
      seller: 'Zachary Thompson',
      description: 'Used, a few scratches, comes with drawer',
      editorIDs: ['user-002'],
      viewerIDs: ['user-003', 'user-005'],
    ),
    UserData3(
      id: '002',
      name: 'Moped',
      price: '600.00',
      imagePath: 'assets/images/default-shopping.png',
      imagePath2: 'assets/images/default-profile.jpg',
      seller: 'Dewey Price',
      description: '300 miles, relatively new condition, no scratches, no dents, no accident history',
      viewerIDs: ['user-001', 'user-005'],
    ),
    UserData3(
      id: '003',
      name: 'Fan',
      price: '20.00',
      imagePath: 'assets/images/default-shopping.png',
      imagePath2: 'assets/images/default-profile.jpg',
      seller: 'Jeff Hernandez',
      description: 'Used, spin function no longer works but in good condition',
      viewerIDs: ['user-005'],
      editorIDs: ['user-003'],
    ),
    UserData3(
      id: '004',
      name: 'TV',
      price: '80.00',
      imagePath: 'assets/images/default-shopping.png',
      imagePath2: 'assets/images/default-profile.jpg',
      seller: 'Rachel Johnson',
      description: 'Used, has fire tv, 45"',
      viewerIDs: ['user-005'],
      editorIDs: ['user-003'],
    ),
  ];
  List<UserData3> get items => _items;

  UserData3 getUser(String itemID) {
    return _items.firstWhere((data) => data.id == itemID);
  }

  List<String> getItemIDs() {
    return _items.map((data) => data.id).toList();
  }
}

UserDB3 userDB3 = UserDB3();
