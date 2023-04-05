import 'package:riverpod_annotation/riverpod_annotation.dart';
part 's3.g.dart';

@riverpod
class S3Notifier extends _$S3Notifier {
  @override
  Future<String> build() {
    const sec3 = Duration(seconds: 3);
    return Future.delayed(sec3, () => '最初のデータ');
  }

  void updateState() async {
    // データを上書き
    state = const AsyncValue.loading();
    // 3秒まつ
    const sec3 = Duration(seconds: 3);
    await Future.delayed(sec3);
    // データを上書き
    state = const AsyncValue.data('変更後のデータ');
  }
}
