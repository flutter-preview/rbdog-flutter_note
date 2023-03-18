import 'package:flutter/material.dart';
import 'package:flutter_note/where_controller/form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_note/part11/page_a.dart';
import 'package:flutter_note/part11/page_c.dart';
import 'package:go_router/go_router.dart';

void main() {
  final app = App();
  final scope = ProviderScope(child: app);
  runApp(scope);
}

/// ホーム画面
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // 進むボタンを押したとき
  push(BuildContext context) {
    // 画面 C へ進む
    context.push('/c');
  }

  // 戻るボタンを押したとき
  back(BuildContext context) {
    // 前の画面 へ戻る
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    // 進むボタン
    final goButton = ElevatedButton(
      onPressed: () => push(context),
      style: ElevatedButton.styleFrom(primary: Colors.blue),
      child: const Text('進む >'),
    );

    // 戻るボタン
    final backButton = ElevatedButton(
      onPressed: () => back(context),
      style: ElevatedButton.styleFrom(primary: Colors.red),
      child: const Text('< 戻る'),
    );

    // 画面全体
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            backButton,
            goButton,
            SizedBox(
              width: 200,
              height: 50,
              child: MyForm(id: '1'),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: MyForm(id: '2'),
            ),
          ],
        ),
      ),
    );
  }
}

// アプリ全体
class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final router = GoRouter(
    // パス (アプリが起動したとき)
    initialLocation: '/a',
    // パスと画面の組み合わせ
    routes: [
      GoRoute(
        path: '/a',
        builder: (context, state) => PageA(),
      ),
      GoRoute(
        path: '/b',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/c',
        builder: (context, state) => PageC(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
