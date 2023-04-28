import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_note/sign_in/state.dart';
import 'package:flutter_note/sign_in/router.dart';

/// スプラッシュ画面
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
          debugPrint('スプラッシュ画面が表示されました 5秒後にホーム画面へ進みます');
          const sec5 = Duration(seconds: 5);
          await Future.delayed(sec5);
          context.go(Pages.home.path);
        },
      );
    } else if (!isSignedIn) {
      // サインインしていない
      WidgetsBinding.instance.addPostFrameCallback(
        (_) async {
          debugPrint('スプラッシュ画面が表示されました 5秒後にサインイン画面へ進みます');
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
