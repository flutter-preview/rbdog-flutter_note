//
// 画面 3つ
//  - スプラッシュ画面
//  - サインイン画面
//  - ホーム画面
//

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_note/sign_in/state.dart';
import 'package:flutter_note/sign_in/router.dart';
import 'package:flutter_note/sign_in/usecase.dart';

/// ---------------------------------------------------------
/// スプラッシュ画面    >> splash.dart
/// ---------------------------------------------------------
class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // サインインしているかどうか
    final isSignedIn = ref.watch(isSignedInProvider);

    if (isSignedIn == null) {
      // まだ分からない
      debugPrint('サインインしているか分からないので画面は進みません');
    } else if (isSignedIn) {
      // サインインしている
      WidgetsBinding.instance.addPostFrameCallback(
        (_) async {
          debugPrint('5秒後にホーム画面へ進みます');
          const sec5 = Duration(seconds: 5);
          await Future.delayed(sec5);
          context.go(Pages.home.path);
        },
      );
    } else if (!isSignedIn) {
      // サインインしていない
      WidgetsBinding.instance.addPostFrameCallback(
        (_) async {
          debugPrint('5秒後にサインイン画面へ進みます');
          const sec5 = Duration(seconds: 5);
          await Future.delayed(sec5);
          context.go(Pages.signIn.path);
        },
      );
    }

    /// 画面全体
    return Scaffold(
      appBar: AppBar(title: const Text('スプラッシュ画面')),
      backgroundColor: Colors.black,
      // 画面の真ん中に Flutter のロゴ
      body: const Center(
        child: FlutterLogo(
          size: 100,
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------
/// サインイン画面    >> sign_in.dart
/// ---------------------------------------------------------
class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ボタン
    final button = ElevatedButton(
      onPressed: () async {
        // ユースケースを呼び出す
        final usecase = SignInUsecase();
        await usecase.start().catchError((e) {
          debugPrint('サインインできませんでした $e');
          return null;
        });
        debugPrint('ホーム画面へ進みます');
        context.go(Pages.home.path);
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
/// ホーム画面    >> home.dart
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
