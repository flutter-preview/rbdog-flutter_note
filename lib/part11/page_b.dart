import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample/part11/router.dart';

// 画面 B
class PageB extends ConsumerWidget {
  const PageB({Key? key}) : super(key: key);

  // 進むボタンを押したとき
  go(WidgetRef ref) {
    final notifier = ref.read(pageNumberProvider.notifier);
    notifier.state += 1;
  }

  // 戻るボタンを押したとき
  back(WidgetRef ref) {
    final notifier = ref.read(pageNumberProvider.notifier);
    notifier.state -= 1;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 画面の上に表示するバー
    final appBar = AppBar(
      backgroundColor: Colors.green,
      title: const Text('画面B'),
    );

    // 進むボタン
    final goButton = ElevatedButton(
      onPressed: () => go(ref),
      child: const Text('進む >'),
    );

    // 戻るボタン
    final backButton = ElevatedButton(
      onPressed: () => back(ref),
      child: const Text('< 戻る'),
    );

    // 画面全体
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            goButton,
            backButton,
          ],
        ),
      ),
    );
  }
}
