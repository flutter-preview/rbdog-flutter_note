import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  final app = MaterialApp(home: Home());
  final scope = ProviderScope(child: app);
  runApp(scope);
}

final isOnProvider = StateProvider((ref) {
  return true;
});

final valueProvider = StateProvider((ref) {
  return 0.0;
});

final rangeProvider = StateProvider((ref) {
  return RangeValues(0.1, 0.9);
});

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
      // 色を変える
      activeColor: Colors.blue,
      activeTrackColor: Colors.green,
      inactiveThumbColor: Colors.black,
      inactiveTrackColor: Colors.grey,
    );

    // スライダー
    final value = ref.watch(valueProvider);
    final slider = Slider(
      value: value,
      onChanged: (value) {
        ref.read(valueProvider.notifier).state = value;
      },
      // 色を変える
      thumbColor: Colors.blue,
      activeColor: Colors.green,
      inactiveColor: Colors.black12,
    );

    // レンジスライダー
    final range = ref.watch(rangeProvider);
    final rangeSlider = RangeSlider(
      values: range,
      onChanged: (value) {
        ref.read(rangeProvider.notifier).state = value;
      },
      // 色を変える
      activeColor: Colors.green,
      inactiveColor: Colors.black12,
    );

    final con = Container(
      width: value * 300,
      height: 20,
      color: Colors.blue,
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            toggleSwitch,
            slider,
            rangeSlider,
            con,
          ],
        ),
      ),
    );
  }
}
