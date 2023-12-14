import 'package:riverpod/riverpod.dart';
import 'class_data.dart';

final userDBProvider2 = Provider<UserDB2>((ref) {
  return UserDB2();
});