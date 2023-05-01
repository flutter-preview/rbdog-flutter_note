import 'package:flutter/material.dart';
import 'package:flutter_note/sign_in/pages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_note/sign_in/state.dart';
part 'router.g.dart';

/// ---------------------------------------------------------
/// GoRouter    >> router/router.dart
/// ---------------------------------------------------------
@riverpod
GoRouter router(RouterRef ref) {
  // アプリが始まった時のパス
  final initialLocation = Pages.signIn.path;

  // パスと画面の組み合わせ
  final routes = [
    // サインイン画面
    GoRoute(
      path: Pages.signIn.path,
      builder: (_, __) => const SignInPage(),
    ),

    // サインインが必要なページをシェルで囲む
    ShellRoute(
      builder: (_, __, child) => UserIdScope(child: child),
      routes: [
        // ホーム画面
        GoRoute(
          path: Pages.home.path,
          builder: (_, __) => const HomePage(),
        ),
      ],
    ),
  ];

  // リダイレクト - 強制的に画面を変更する
  String? redirect(BuildContext context, GoRouterState state) {
    // サインインしているかどうか
    final signedIn = ref.read(signedInProvider);

    if (signedIn && state.location == Pages.signIn.path) {
      // Yes && サインイン画面 --> ホーム画面へ
      return Pages.home.path;
    } else if (!signedIn) {
      // No --> サインイン画面へ
      return Pages.signIn.path;
    } else {
      return null;
    }
  }

  // Riverpod と GoRouter を連動させるコード
  // サインイン状態が切り替わったときに GoRouter が反応する
  final listenable = ValueNotifier<Object?>(null);
  ref.listen<Object?>(signedInProvider, (_, newState) {
    listenable.value = newState;
  });
  ref.onDispose(listenable.dispose);

  // GoRouterを作成
  return GoRouter(
    initialLocation: initialLocation,
    routes: routes,
    redirect: redirect,
    refreshListenable: listenable,
  );
}

/// ---------------------------------------------------------
/// アプリ本体    >> router/app.dart
/// ---------------------------------------------------------
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
