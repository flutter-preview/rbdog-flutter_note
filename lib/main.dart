import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample/part19/pack.dart';
import 'package:flutter_sample/part19/vegetable.dart';

/// メイン関数
void main() {
  test4();
}

void test1() async {
  // Stubを使えるようにする
  WidgetsFlutterBinding.ensureInitialized();
  // JSON <--- Stub
  final json = await rootBundle.loadString('stub/level1.json');
  // JsonMap <--- JSON
  final map = jsonDecode(json);
  // 野菜データ <--- JsonMap
  final data = Vegetable.fromJson(map);
  // データの中身を確認
  debugPrint('データの中身は $data');
}

void test2() async {
  // 適当な野菜のデータ
  const data = Vegetable(
    name: 'キャベツ',
    color: 'みどり',
    season: '春と冬',
  );

  // JsonMap <--- 野菜データ
  final map = data.toJson();

  // JSON <--- JsonMap
  final json = jsonEncode(map);

  // JSONの中身を確認する
  debugPrint('JSONの中身は $json');
}

void test3() async {
  // Stubを使えるようにする
  WidgetsFlutterBinding.ensureInitialized();

  // JSON <--- Stub
  final json = await rootBundle.loadString('stub/level2.json');

  // JsonMap <--- JSON
  final map = jsonDecode(json);

  // 野菜パックのデータ <--- JsonMap
  final data = Pack.fromJson(map);

  // 中身を確認する
  debugPrint('データの中身は $data');
}

void test4() async {
  // 適当な野菜
  const content = Vegetable(
    name: 'アボガド',
    color: '濃いみどり',
    season: '秋',
  );
  // 野菜パックのデータ
  const data = Pack(
    size: '中',
    price: 800,
    content: content,
  );

  // JsonMap <--- 野菜パックのデータ
  final map = data.toJson();

  // JSON <--- JsonMap
  final json = const JsonEncoder.withIndent('  ').convert(map);

  // 確認
  debugPrint('JSONの中身は $json');
}

void test5() async {}

void test6() async {}
void test7() async {}
void test8() async {}
void test9() async {}
void test10() async {}
