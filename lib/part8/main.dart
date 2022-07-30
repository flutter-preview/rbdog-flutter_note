import 'package:flutter/material.dart';

void main() {
  // テキストフィールド の コントローラー
  final controller = TextEditingController();

  // テキストフィールド本体
  const textField = TextField(
    // デコレーション
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: "あなたの名前",
      hintText: "カタカナで入力してください",
      errorText: null, // エラーなし
    ),
  );

  // ボタンの関数
  xxxx() {
    // コントローラーから文字を取り出す
    debugPrint(controller.text);
  }

  // ボタン
  final button = ElevatedButton(
    onPressed: xxxx,
    child: Text('ボタン'),
  );

  // アプリ
  final a = MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // コンテナを使って テキストフィールド の大きさを整える
            Container(
              width: 300,
              child: textField,
            ),
            // コンテナの下にボタンをおく
            button,
          ],
        ),
      ),
    ),
  );

  // アプリを動かす
  runApp(a);
}
