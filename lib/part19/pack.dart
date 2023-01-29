// 他のファイルに書いた Vegetable を使うために import
import 'package:flutter_sample/part19/vegetable.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'pack.freezed.dart';
part 'pack.g.dart';

@freezed
class Pack with _$Pack {
  const factory Pack({
    required String size,
    required int price,
    required Vegetable content,
  }) = _Pack;
  factory Pack.fromJson(Map<String, dynamic> json) => _$PackFromJson(json);
}
