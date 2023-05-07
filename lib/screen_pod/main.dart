import 'package:flutter/material.dart';
import 'package:flutter_note/screen_pod/screen_pod.dart';

// デバイスプレビューを使う場合
//
// import 'package:device_preview/device_preview.dart';
//
// void main() async {
//   const home = HomePage();
//   const app = MaterialApp(home: home);
//   final devicePreview = DevicePreview(builder: (_) => app);
//   runApp(devicePreview);
// }

void main() async {
  const home = HomePage();
  const app = MaterialApp(home: home);
  runApp(app);
}

/// 画面サイズクラス
enum ScreenSizeClass {
  phone, // スマホ
  tablet, // タブレット
  desktop; // パソコン
}

/// 画面サイズの設定値
const screenProvider = ScreenProvider(
  designWidth: 390, // iPhone14の幅をデザイン基準にする
  designHeight: 844,
  breakpoints: {
    ScreenSizeClass.phone: 320, // スマホ表示に必要な最低限の幅
    ScreenSizeClass.tablet: 600,
    ScreenSizeClass.desktop: 1000,
  },
);

/// ホーム画面
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = ScreenRef(context).watch(screenProvider);

    // 画面サイズクラス
    late final String sizeClass;
    switch (screen.sizeClass) {
      case ScreenSizeClass.phone:
        sizeClass = 'スマホサイズ';
        break;
      case ScreenSizeClass.tablet:
        sizeClass = 'タブレットサイズ';
        break;
      case ScreenSizeClass.desktop:
        sizeClass = 'パソコンサイズ';
        break;
    }

    // 画面回転の向き
    late final String orientation;
    switch (screen.orientation) {
      case Orientation.portrait:
        orientation = 'たて画面';
        break;
      case Orientation.landscape:
        orientation = 'よこ画面';
        break;
    }

    // 設計上(iPhone14) では 200
    final designW = screen.designW(200);

    // 設計上(iPhone14) では 400
    final designH = screen.designH(400);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // 文字 1
            Text(
              sizeClass,
              style: const TextStyle(fontSize: 30),
            ),
            // 文字 2
            Text(
              orientation,
              style: const TextStyle(fontSize: 30),
            ),
            // 色付きコンテナ
            Container(
              color: Colors.orange,
              width: designW,
              height: designH,
            ),
          ],
        ),
      ),
    );
  }
}
