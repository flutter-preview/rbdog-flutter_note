import 'package:flutter/material.dart';
import 'package:pixel_color_image/pixel_color_image.dart';

// マウスがホバリングしているとき
void onHover(int x, int y, Color color) async {
  debugPrint('ホバー中 x: $x, y: $y, color: $color');
}

// タップされたとき
void onTap(int x, int y, Color color) async {
  debugPrint('タップされました x: $x, y: $y, color: $color');
}

// 表示する画像を加工したいとき
Widget buildImage(BuildContext context, Image image) {
  // 加工がいらないときは ここで return image;

  // Stack を使って 画像を後ろに隠す
  return Stack(
    alignment: Alignment.center,
    children: [
      // 後ろに隠れる画像
      image,
      // 同じ大きさのWidgetを前におく
      const Positioned.fill(
        child: ColoredBox(color: Colors.black), // 前に置きたい Widget
      ),
    ],
  );
}

// プレビューと画像を繋ぐための ref
final ref = PixelColorRef();

// main
void main() {
  // ピクセルカラー読み取りWidget
  final img = PixelColor.assetImage(
    ref: ref,
    // 画像はここにあります
    // assets/images フォルダへおいてください
    // https://github.com/rbdog/flutter_note/blob/main/assets/images/banana.png
    path: 'assets/images/banana.png',
    onHover: onHover,
    onTap: onTap,
    buildImage: buildImage,
  );

  // カラープレビュー
  final preview = PixelColorPreview(
    ref: ref,
  );

  // アプリ
  final app = MaterialApp(
    // 画面
    home: Scaffold(
      backgroundColor: Colors.grey,
      // 真ん中
      body: Center(
        // カラム
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // カラープレビュー
            preview,
            // 画像
            img,
          ],
        ),
      ),
    ),
  );

  // アプリを実行
  runApp(app);
}
