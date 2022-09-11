import 'package:flutter_riverpod/flutter_riverpod.dart';

// ページナンバー
final pageNumberProvider = StateProvider<int>((ref) {
  return 1;
});
