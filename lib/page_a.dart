import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//
// 画面 A
//
class PageA extends StatelessWidget {
  const PageA({Key? key}) : super(key: key);

  // 進むボタンを押したとき
  push(BuildContext context) {
    // 画面 B へ進む
    context.push('/b');
  }

  @override
  Widget build(BuildContext context) {
    // 画面の上に表示するバー
    final appBar = AppBar(
      backgroundColor: Colors.red,
      title: const Text('画面 A'),
    );

    // 進むボタン
    final pushButton = ElevatedButton(
      onPressed: () => push(context),
      style: ElevatedButton.styleFrom(primary: Colors.green),
      child: const Text('進む >'),
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            pushButton,
          ],
        ),
      ),
    );
  }
}
