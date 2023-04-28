import 'package:flutter/material.dart';
import 'package:flutter_note/sign_in/router.dart';
import 'package:flutter_note/sign_in/usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// サインイン画面
class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final button = ElevatedButton(
      child: const Text('サインイン'),
      onPressed: () async {
        final usecase = SignInUsecase();
        await usecase.start().catchError(
          (e) {
            debugPrint('サインインできませんでした $e');
            return null;
          },
        );
        debugPrint('ホーム画面へ進みます');
        context.go(Pages.home.path);
      },
    );

    /// 画面全体
    return Scaffold(
      appBar: AppBar(title: const Text('サインイン画面')),
      body: Center(child: button),
    );
  }
}
