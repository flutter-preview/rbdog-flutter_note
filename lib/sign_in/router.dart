import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_note/sign_in/home_page.dart';
import 'package:flutter_note/sign_in/sign_in_page.dart';
import 'package:flutter_note/sign_in/splash_page.dart';
import 'package:flutter_note/sign_in/state.dart';
part 'router.g.dart';

// ページ一覧
enum Pages {
  splash,
  signIn,
  home,
}

// ページごとのパス
extension PagePath on Pages {
  String get path {
    switch (this) {
      case Pages.splash:
        return '/splash';
      case Pages.signIn:
        return '/sign-in';
      case Pages.home:
        return '/home';
    }
  }
}

// GoRouter
@riverpod
GoRouter router(RouterRef ref) {
  // アプリが始まった時のパス
  final initialLocation = Pages.splash.path;

  // 非公開ページ - サインインが必要
  final privateRoutes = [
    // ホーム画面
    GoRoute(
      path: Pages.home.path,
      builder: (_, __) => const HomePage(),
    ),
  ];

  // 公開ページ - 誰でも見れる
  final publicRoutes = [
    // スプラッシュ画面
    GoRoute(
      path: Pages.splash.path,
      builder: (_, __) => const SplashPage(),
    ),
    // サインイン画面
    GoRoute(
      path: Pages.signIn.path,
      builder: (_, __) => const SignInPage(),
    ),
  ];

  // 非公開ページ + 公開ページ
  final allRoutes = [
    // 非公開ページ
    ShellRoute(
      routes: privateRoutes,
    ),
    // 公開ページ
    ShellRoute(
      routes: publicRoutes,
      // 公開ページはデータを上書き
      builder: (_, __, child) {
        final user = ref.read(userNotifierProvider);
        return user.when(
          loading: () => const CircularProgressIndicator(),
          error: (_, __) => const CircularProgressIndicator(),
          // プロバイダースコープ
          data: (data) => ProviderScope(
            overrides: [
              // ユーザーIDを上書き
              userIdProvider.overrideWithValue(data!.uid),
            ],
            child: child,
          ),
        );
      },
    ),
  ];

  // リダイレクト - 強制的に画面を変更する
  String? redirect(BuildContext context, GoRouterState state) {
    // 開こうとしている画面
    final page = state.location;

    // サインインしているかどうか (分からないときは false)
    final isSignedIn = ref.read(isSignedInProvider) ?? false;

    // 公開ページかどうか
    final publicPages = publicRoutes.map((route) => route.path);
    final isPublicPage = publicPages.contains(page);

    // サインインしていない && 公開ページではない
    if (!isSignedIn && !isPublicPage) {
      debugPrint('サインイン画面へリダイレクトします');
      return Pages.signIn.path;
    }
    return null;
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
    routes: allRoutes,
    redirect: redirect,
    refreshListenable: listenable,
  );
}
