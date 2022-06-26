import 'package:flutter/material.dart';
import 'package:pixel_color_image/pixel_color_image.dart';

// マウスがホバリングしているとき
void onHover(int x, int y, Color color) async {
  debugPrint('ホバリング中 x: $x, y: $y, color: $color');
}

// タップされたとき
void onTap(int x, int y, Color color) async {
  debugPrint('タップされました x: $x, y: $y, color: $color');
}

// main
void main() {
  // 画像の Widget を作る
  const img = PixelColor.assetImage(
    path: 'images/banana.png',
    onHover: onHover,
    onTap: onTap,
  );

  // アプリ
  const app = MaterialApp(
    home: Scaffold(
      body: Center(
        child: img, // アプリの中に表示する
      ),
    ),
  );

  // アプリを実行
  runApp(app);
}
