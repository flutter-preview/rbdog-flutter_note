import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note/sign_in/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ホーム画面
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
