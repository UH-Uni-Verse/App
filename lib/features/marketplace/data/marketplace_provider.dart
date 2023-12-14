import 'package:riverpod/riverpod.dart';
import 'marketplace_data.dart';

final userDBProvider3 = Provider<UserDB3>((ref) {
  return UserDB3();
});