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
      builder: (_, __, child) => SignedInShell(child: child),
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
    final isSignedIn = ref.read(isSignedInProvider);

    if (isSignedIn && state.location == Pages.signIn.path) {
      // Yes && サインイン画面にいる --> ホーム画面へ
      return Pages.home.path;
    } else if (!isSignedIn) {
      // No --> サインイン画面へ
      return Pages.signIn.path;
    } else {
      return null;
    }
  }

  // Riverpod と GoRouter を連動させるコード
  // サインイン状態が切り替わったときに GoRouter が反応する
  final listenable = ValueNotifier<Object?>(null);
  ref.listen<Object?>(isSignedInProvider, (_, newState) {
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
/// サインインが必要なページを囲むシェル    >> router/signed_in_shell.dart
/// ---------------------------------------------------------

/// サインイン中しか使えないユーザーID
@riverpod
String userId(UserIdRef ref) {
  throw 'シェルで囲まれた画面でないと使えません';
}

/// サインインが必要なページを囲むシェル
class SignedInShell extends ConsumerWidget {
  const SignedInShell({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// サインインしているユーザーの情報
    final user = ref.watch(firebaseUserNotifierProvider);
    final userId = user.value?.uid;
    if (userId == null) {
      // ユーザーIDがないとき
      return const CircularProgressIndicator();
    } else {
      // ユーザーIDがあるとき
      return ProviderScope(
        // ユーザーIDを上書き
        overrides: [
          userIdProvider.overrideWithValue(userId),
        ],
        child: child,
      );
    }
  }
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
