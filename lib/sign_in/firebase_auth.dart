import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  /// サインアップ (ソーシャルログインの場合は使わない)
  Future<void> basicSignUp(String email, String password) async {
    // Firebaseへ送る
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// サインイン (ソーシャルログインの場合は使わない)
  Future<void> basicSignIn(String email, String password) async {
    // Firebaseへ送る
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
