import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_note/sign_in/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_note/sign_in/service.dart';

// ページ一覧
enum Pages {
  // サインイン画面
  signIn,
  // ホーム画面
  home,
}

// ページごとのパス
extension PagePath on Pages {
  String get path {
    switch (this) {
      case Pages.signIn:
        return '/sign-in';
      case Pages.home:
        return '/home';
    }
  }
}

/// ---------------------------------------------------------
/// サインイン画面    >> pages/sign_in.dart
/// ---------------------------------------------------------
class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ボタン
    final button = ElevatedButton(
      onPressed: () async {
        // ユースケースを呼び出す
        final usecase = SignInService();
        await usecase.start().catchError((e) {
          debugPrint('サインインできませんでした $e');
          return null;
        });
        debugPrint('サインイン完了しました');
      },
      child: const Text('サインイン'),
    );

    /// 画面全体
    return Scaffold(
      appBar: AppBar(title: const Text('サインイン画面')),
      body: Center(child: button),
    );
  }
}

/// ---------------------------------------------------------
/// ホーム画面    >> pages/home.dart
/// ---------------------------------------------------------
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ユーザーID
    final userId = ref.watch(userIdProvider);
    final userIdText = Text('ユーザーID: $userId');

    // ボタン
    final button = ElevatedButton(
      onPressed: () {
        // Firebaseと通信してサインアウトする
        FirebaseAuth.instance.signOut();
      },
      child: const Text('サインアウト'),
    );

    // 画面全体
    return Scaffold(
      appBar: AppBar(title: const Text('ホーム画面')),
      body: Center(
        // 縦に並べる
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // テキスト
            userIdText,
            // ボタン
            button,
          ],
        ),
      ),
    );
  }
}
