import 'package:riverpod/riverpod.dart';
import 'class_data.dart';

final userDBProvider = Provider<UserDB>((ref) {
  return UserDB();
});