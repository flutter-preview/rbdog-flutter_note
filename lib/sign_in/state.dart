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
/// サインイン中かどうか
///   - true: サインイン中
///   - false: サインアウト中
///   - null: 不明
///
@riverpod
bool? isSignedIn(IsSignedInRef ref) {
  final user = ref.watch(firebaseUserNotifierProvider);
  return user.when(
    loading: () => null,
    error: (_, __) => null,
    data: (d) => d != null, // データがあったらtrue
  );
}

///
/// ユーザーID
///
@riverpod
String userId(UserIdRef ref) {
  // MEMO: サインインしてから GoRouter の中で上書きする
  throw Exception('サインインしないと使えません');
}
