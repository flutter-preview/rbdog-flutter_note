import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pure.g.dart';

@riverpod
String pure(PureRef ref) {
  return 'HELLO';
}

final itemStreamProvider = StreamProvider<String>((ref) {
  final controller = StreamController<String>();
  // 3秒後にメッセージを3件
  const sec3 = Duration(seconds: 3);
  Future.delayed(sec3, () {
    controller.add('メッセージが3件届きました');
  });
  // 7秒後にメッセージを7件
  const sec7 = Duration(seconds: 7);
  Future.delayed(sec7, () {
    controller.add('メッセージが7件届きました');
  });
  return controller.stream;
});
