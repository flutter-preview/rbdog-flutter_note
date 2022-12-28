import 'package:flutter/material.dart';
import 'package:flutter_sample/nintendo/colors.dart';

class MyTextStyles {
  // XLサイズ 太字
  static const xlBold = TextStyle(
    color: MyColors.black,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  // Lサイズ 太字
  static const lBold = TextStyle(
    color: MyColors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  // Mサイズ
  static const m = TextStyle(
    color: MyColors.black,
    fontSize: 14,
  );

  // Mサイズ 太字
  static const mBold = TextStyle(
    color: MyColors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  // Mサイズ グレー
  static final mGrey = TextStyle(
    color: MyColors.darkGrey,
    fontSize: 14,
  );

  // Sサイズ
  static const s = TextStyle(
    color: MyColors.black,
    fontSize: 12,
  );

  // Sサイズ グレー
  static final sGrey = TextStyle(
    color: MyColors.darkGrey,
    fontSize: 12,
  );

  // XSサイズ 緑
  static const xsGreen = TextStyle(
    color: MyColors.green,
    fontSize: 10,
  );
}
