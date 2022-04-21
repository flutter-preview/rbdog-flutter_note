import 'package:flutter/material.dart';

void main() {
  // 画像
  final img = Image.asset(
    'images/sushi.jpeg',
  );

  // ロー
  final row = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [img, img, img],
  );

  // アプリ
  final a = MaterialApp(
    home: Scaffold(
      body: Center(
        child: row,
      ),
    ),
  );
  runApp(a);
}
