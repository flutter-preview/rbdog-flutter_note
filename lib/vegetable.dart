import 'package:freezed_annotation/freezed_annotation.dart';
part 'vegetable.freezed.dart';
part 'vegetable.g.dart';

@freezed
class Vegetable with _$Vegetable {
  const factory Vegetable({
    // 名前
    required String name,

    // 色
    required String color,

    // 季節
    required String season,
  }) = _Vegetable;
  factory Vegetable.fromJson(Map<String, dynamic> json) =>
      _$VegetableFromJson(json);
}
