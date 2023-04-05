import 'package:flutter/material.dart';
import 'package:flutter_note/riverpod/pure.dart';
import 'package:flutter_note/riverpod/s1.dart';
import 'package:flutter_note/riverpod/s2.dart';
import 'package:flutter_note/riverpod/s3.dart';
import 'package:flutter_note/riverpod/s4.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyWidget extends ConsumerWidget {
  const MyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // S1 watch
    final s1 = ref.watch(s1NotifierProvider);
    // S1 listen
    ref.listen(
      s1NotifierProvider,
      (oldState, newState) {
        // スナックバーを表示
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('S1データが変更されました'),
          ),
        );
      },
    );
    // S1 テキスト
    final s1Text = Text('$s1');
    // S1 ボタン
    final s1Button = ElevatedButton(
      onPressed: () {
        // S1 ノティファイアを呼ぶ
        final notifier = ref.read(s1NotifierProvider.notifier);
        // S1 データを変更
        notifier.updateState();
      },
      child: const Text('S1'),
    );

    // S2 watch
    final s2 = ref.watch(s2NotifierProvider);
    // S2 ボタン
    final s2Button = ElevatedButton(
      onPressed: () {
        // S2 ノティファイアを呼ぶ
        final notifier = ref.read(s2NotifierProvider.notifier);
        // S2 データを変更
        notifier.updateState();
      },
      child: const Text('S2'),
    );

    // S3 watch
    final s3 = ref.watch(s3NotifierProvider);
    // S3 AsyncValue
    final s3Text = s3.when(
      loading: () => const Text('準備中'),
      error: (e, s) => Text('エラー $e'),
      data: (d) => Text(d),
    );
    // S3 ボタン
    final s3Button = ElevatedButton(
      onPressed: () {
        // S3 ノティファイアを呼ぶ
        final notifier = ref.read(s3NotifierProvider.notifier);
        // S3 データを変更
        notifier.updateState();
      },
      child: const Text('S3'),
    );

    // S4 watch
    final s4 = ref.watch(s4NotifierProvider);
    // S3 AsyncValue
    final s4Text = s4.when(
      loading: () => const Text('準備中'),
      error: (e, s) => Text('エラー $e'),
      data: (d) => Text(d),
    );
    // S4 ボタン
    final s4Button = ElevatedButton(
      onPressed: () {
        // S4 ノティファイアを呼ぶ
        final notifier = ref.read(s4NotifierProvider.notifier);
        // S4 データを変更
        notifier.updateState();
      },
      child: const Text('S4'),
    );

    // 縦に並べる
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // 横に並べる
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [s1Text, s1Button],
        ),
        // 横に並べる
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text('$s2'), s2Button],
        ),
        // 横に並べる
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [s3Text, s3Button],
        ),
        // 横に並べる
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [s4Text, s4Button],
        ),
      ],
    );
  }
}
