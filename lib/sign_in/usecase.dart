import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// サインインの流れをまとめておくユースケース
class SignInUsecase {
  /// サインイン開始
  Future<void> start() async {
    /* Google OAuth と通信 */

    // あらかじめ登録しておいたクライアントID
    const clientId = 'xxxxx.apps.googleusercontent.com';

    // アプリが知りたい情報
    const scopes = [
      'openid', // 他サービス連携用のID
      'profile', // 住所や電話番号
      'email', // メールアドレス
    ];

    // Googleでサインイン の画面へ飛ばす
    final request = GoogleSignIn(clientId: clientId, scopes: scopes);
    final response = await request.signIn();

    // 受け取ったデータの中からアクセストークンを取り出す
    final authn = await response?.authentication;
    final accessToken = authn?.accessToken;

    // アクセストークンが null だったら中止
    if (accessToken == null) {
      debugPrint('サインインを中止しました');
      return;
    }

    /* Firebase と通信 */

    // 必要な情報をまとめてクレデンシャルを作る
    final oAuthCredential = GoogleAuthProvider.credential(
      accessToken: accessToken,
    );

    // Firebaseへ送る
    await FirebaseAuth.instance.signInWithCredential(
      oAuthCredential,
    );
  }
}
