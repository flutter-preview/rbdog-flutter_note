import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// メイン関数
main() {
  const app = MaterialApp(home: Home());
  const scope = ProviderScope(child: app);
  runApp(scope);
}

// トグルスイッチが ON(true) か OFF(false) か
final isOnProvider = StateProvider((ref) {
  return true;
});

// スライダーの数値
final valueProvider = StateProvider((ref) {
  return 0.0;
});

// レンジスライダーの範囲
final rangeProvider = StateProvider((ref) {
  return const RangeValues(0.0, 1.0);
});

// ホーム画面
class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // トグルスイッチ
    final isOn = ref.watch(isOnProvider);
    final toggleSwitch = Switch(
      value: isOn,
      onChanged: (isOn) {
        ref.read(isOnProvider.notifier).state = isOn;
      },
      activeColor: Colors.blue,
      activeTrackColor: Colors.green,
      inactiveThumbColor: Colors.black,
      inactiveTrackColor: Colors.grey,
    );

    // 太陽
    const sun = Icon(
      Icons.light_mode,
      color: Colors.orange,
      size: 80,
    );
    const moon = Icon(
      Icons.dark_mode,
      color: Colors.black87,
      size: 80,
    );
    // 太陽か月のアイコン
    final sunOrMoon = isOn ? sun : moon;

    // スライダー
    final value = ref.watch(valueProvider);
    final slider = Slider(
      value: value,
      onChanged: (value) {
        ref.read(valueProvider.notifier).state = value;
      },
      thumbColor: Colors.blue,
      activeColor: Colors.green,
      inactiveColor: Colors.black12,
    );

    // 雲
    final cloud = Icon(Icons.cloud, color: Colors.grey, size: value * 200);

    // レンジスライダー
    final range = ref.watch(rangeProvider);
    final rangeSlider = RangeSlider(
      values: range,
      onChanged: (range) {
        ref.read(rangeProvider.notifier).state = range;
      },
      activeColor: Colors.green,
      inactiveColor: Colors.black12,
    );

    // 気温範囲のテキスト
    final startDegree = (range.start * 50).round();
    final endDegree = (range.end * 50).round();
    final degreeText = Text(
      '$startDegree 〜 $endDegree 度',
      style: const TextStyle(fontSize: 26),
    );

    // 縦に並べる
    final col = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        toggleSwitch,
        sunOrMoon,
        const Spacer(),
        slider,
        cloud,
        const Spacer(),
        rangeSlider,
        degreeText,
        const Spacer(),
      ],
    );

    // 中心に表示
    return Scaffold(
      body: Center(
        child: col,
      ),
    );
  }
}
