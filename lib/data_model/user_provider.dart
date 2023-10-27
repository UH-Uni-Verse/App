import 'package:riverpod/riverpod.dart';
import 'user_data.dart';

final userDBProvider = Provider<UserDB>((ref) {
  return UserDB();
});