import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample/part11/router.dart';

// 画面 A
class PageA extends ConsumerWidget {
  const PageA({Key? key}) : super(key: key);

  // 進むボタンを押したとき
  go(WidgetRef ref) {
    final notifier = ref.read(pageNumberProvider.notifier);
    notifier.state += 1;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 画面の上に表示するバー
    final appBar = AppBar(
      backgroundColor: Colors.red,
      title: const Text('画面A'),
    );

    // 進むボタン
    final goButton = ElevatedButton(
      onPressed: () => go(ref),
      child: const Text('進む >'),
    );

    // 画面全体
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            goButton,
          ],
        ),
      ),
    );
  }
}
