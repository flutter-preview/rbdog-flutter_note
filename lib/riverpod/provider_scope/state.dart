import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'state.g.dart';

@riverpod
class CountNotifier extends _$CountNotifier {
  @override
  int build() {
    return 0;
  }

  void updateState() {
    final oldState = state;
    final newState = oldState + 1;
    state = newState;
  }
}
