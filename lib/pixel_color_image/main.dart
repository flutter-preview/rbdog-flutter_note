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
void main() async {
  // はじめに imageBytes を読み込む

  // アセットから画像を読み込むとき
  final imageBytes = await getImageBytesAsset('images/banana.png');

  // サーバーから画像を読み込むとき
  // final imageBytes = await getImageBytesUrl('https://flutter-image-network.web.app/inu.jpeg');

  // 専用の Widget を作る
  final pixelColorImage = PixelColorImage(
    imageBytes: imageBytes,
    onHover: onHover,
    onTap: onTap,
  );

  // アプリ
  final app = MaterialApp(
    home: Scaffold(
      body: Center(
        child: pixelColorImage, // アプリの中に表示する
      ),
    ),
  );

  // アプリを実行
  runApp(app);
}
