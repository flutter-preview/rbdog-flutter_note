import 'package:flutter/material.dart';

// assets/images に画像を追加
// pubspec.yaml に asstes パスを追加
// オンラインで犬の画像を表示 URL
// https://flutter-image-network.web.app/inu.jpeg

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
