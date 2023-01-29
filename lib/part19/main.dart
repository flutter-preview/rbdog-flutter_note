import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample/part19/vegetable.dart';
import 'package:flutter_sample/part19/pack.dart';
import 'package:flutter_sample/part19/recipe.dart';

/// メイン関数
void main() {
  test1();
  test2();
  test3();
  test4();
  test5();
  test6();
}

// JSONを受け取る練習 レベル1
void test1() async {
  // Stub を使えるようにする
  WidgetsFlutterBinding.ensureInitialized();
  // JSON <--- Stub
  final json = await rootBundle.loadString('stub/level1.json');
  // JsonMap <--- JSON
  final map = jsonDecode(json);
  // 野菜データ <--- JsonMap
  final data = Vegetable.fromJson(map);
  // データの中身を確認する
  debugPrint('データの中身は $data');
}

// JSONを受け取る練習 レベル2
void test2() async {
  // Stub を使えるようにする
  WidgetsFlutterBinding.ensureInitialized();
  // JSON <--- Stub
  final json = await rootBundle.loadString('stub/level2.json');
  // JsonMap <--- JSON
  final map = jsonDecode(json);
  // 野菜パック <--- JsonMap
  final data = Pack.fromJson(map);
  // データの中身を確認する
  debugPrint('データの中身は $data');
}

// JSONを受け取る練習 レベル3
void test3() async {
  // Stub を使えるようにする
  WidgetsFlutterBinding.ensureInitialized();
  // JSON <--- Stub
  final json = await rootBundle.loadString('stub/level3.json');
  // JsonMap <--- JSON
  final map = jsonDecode(json);
  // レシピのデータ <--- JsonMap
  final data = Recipe.fromJson(map);
  // データの中身を確認する
  debugPrint('データの中身は $data');
}

// JSONを送る練習 レベル1
void test4() async {
  // 野菜データを作る
  const data = Vegetable(
    name: 'キャベツ',
    color: 'みどり',
    season: '春と冬',
  );
  // JsonMap <--- データ
  final map = data.toJson();
  // JSON <--- JsonMap
  final json = jsonEncode(map);
  // JSONの中身を確認する
  debugPrint('JSONの中身は $json');
}

// JSONを送る練習 レベル2
void test5() async {
  // 野菜パックの中身
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
  // JsonMap <--- データ
  final map = data.toJson();
  // JSON <--- JsonMap
  final json = jsonEncode(map);
  // JSONの中身を確認する
  debugPrint('JSONの中身は $json');
}

// JSONを送る練習 レベル3
void test6() async {
  // レシピに使う野菜たち
  const vegetables = [
    Vegetable(
      name: 'しょうが',
      color: '黄色',
      season: '秋',
    ),
    Vegetable(
      name: 'かぶ',
      color: '白',
      season: '冬',
    ),
    Vegetable(
      name: 'たけのこ',
      color: '茶色',
      season: '春',
    ),
  ];
  // レシピのデータ
  const data = Recipe(
    title: '健康スープ',
    calories: 150,
    vegetables: vegetables,
  );
  // JsonMap <--- データ
  final map = data.toJson();
  // JSON <--- JsonMap
  final json = jsonEncode(map);
  // JSONの中身を確認する
  debugPrint('JSONの中身は $json');
}

/*
*
*  ### 豆知識 ###
*    final json = jsonEncode(map);
*    の代わりに
*    final json = const JsonEncoder.withIndent('  ').convert(map);
*    を使うと、
*    ログに出したときに見やすくなるよ!
*
*/
