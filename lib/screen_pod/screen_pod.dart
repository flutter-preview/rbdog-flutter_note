import 'package:flutter/material.dart';

///
/// [Example]
/// ```dart
///
/// 1. 対応したい画面サイズクラスを定義
/// enum ScreenSizeClass {
///   phone, // スマホ
///   tablet, // タブレット
///   desktop; // パソコン
/// }
///
/// 2. プロバイダーを定義する
/// const screenProvider = ScreenProvider(
///   designWidth: 390, // iPhone14の幅をデザイン基準にする
///   designHeight: 844, // iPhone14の高さをデザイン基準にする
///   breakpoints: {
///     ScreenSizeClass.phone: 320, // スマホ表示に必要な最低限の幅
///     ScreenSizeClass.tablet: 600,
///     ScreenSizeClass.desktop: 1000,
///   },
/// );
///
/// 3. ウィジェットの中から `watch` する
/// final screen = ScreenRef(context).watch(screenProvider);
///
/// 4. データを取り出して使う
/// final sizeClass = screen.sizeClass; // スマホ or タブレット or パソコン
/// final orientation = screen.orientation; // 回転の向き
/// final designW = screen.designW(100); // デザイン基準に合わせて伸縮する幅
/// final designH = screen.designH(100); // デザイン基準に合わせて伸縮する高さ
/// ```

/// Screen Data
class Screen<SizeClass> {
  const Screen._({
    required this.sizeClass,
    required this.ratioToDesignW,
    required this.ratioToDesignH,
    required this.orientation,
  });

  /// サイズクラス
  final SizeClass sizeClass;

  /// 設計に対する実際のサイズ比 幅
  final double ratioToDesignW;

  /// 設計に対する実際のサイズ比 高さ
  final double ratioToDesignH;

  /// 画面の回転の向き
  final Orientation orientation;

  /// デザイン基準より大きい画面では大きく, 小さい画面では小さくなる幅
  double designW(double value) => value * ratioToDesignW;

  /// デザイン基準より大きい画面では大きく, 小さい画面では小さくなる高さ
  double designH(double value) => value * ratioToDesignH;
}

/// Provider for design config
class ScreenProvider<SizeClass> {
  const ScreenProvider({
    required this.designWidth,
    required this.designHeight,
    required this.breakpoints,
  });
  final double designWidth;
  final double designHeight;
  final Map<SizeClass, double> breakpoints;
}

/// Something like WidgetRef in Riverpod.
class ScreenRef {
  const ScreenRef(this.context);
  final BuildContext context;

  /// ref.watch(provider)
  Screen<SizeClass> watch<SizeClass>(
    ScreenProvider<SizeClass> provider,
  ) {
    // 全ての画面サイズクラス (ブレークポイントが大きい順)
    final sizeClasses = provider.breakpoints.entries.toList();
    sizeClasses.sort(
      (a, b) => b.value.compareTo(a.value),
    );
    // 実際の画面サイズ
    final size = MediaQuery.of(context).size;
    // 条件に合った画面サイズクラス
    final sizeClass = sizeClasses.firstWhere(
      (it) => size.width > it.value,
      orElse: () => throw 'この画面サイズには対応していません',
    );
    // 設計に対する実際のサイズ比
    final ratioToDesignW = size.width / provider.designWidth;
    final ratioToDesignH = size.height / provider.designHeight;
    // 画面の回転の向き
    final orientation = MediaQuery.of(context).orientation;

    return Screen._(
      sizeClass: sizeClass.key,
      ratioToDesignW: ratioToDesignW,
      ratioToDesignH: ratioToDesignH,
      orientation: orientation,
    );
  }
}
