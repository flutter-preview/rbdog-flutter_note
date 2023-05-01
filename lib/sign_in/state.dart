import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'state.g.dart';

///
/// Firebaseのユーザーを管理するノティファイヤー
///
@riverpod
class FirebaseUserNotifier extends _$FirebaseUserNotifier {
  @override
  Stream<User?> build() {
    // Firebaseからユーザーの変化を教えてもらう
    return FirebaseAuth.instance.authStateChanges();
  }
}

///
/// ユーザー
///
@riverpod
User? user(UserRef ref) {
  final user = ref.watch(firebaseUserNotifierProvider);
  return user.when(
    loading: () => null,
    error: (_, __) => null,
    data: (d) => d,
  );
}

///
/// サインイン中かどうか
///
@riverpod
bool isSignedIn(IsSignedInRef ref) {
  final user = ref.watch(userProvider);
  return user != null;
}
