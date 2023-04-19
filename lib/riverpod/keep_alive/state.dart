import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'state.g.dart';

@riverpod
class CountNotifier extends _$CountNotifier {
  @override
  int build() {
    return 0;
  }

  // データを変更する関数
  void updateState() {
    // 変更前のデータ
    final oldState = state;
    // 変更後のデータ
    final newState = oldState + 1;
    // データを上書き
    state = newState;
  }
}
