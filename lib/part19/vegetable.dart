import 'package:freezed_annotation/freezed_annotation.dart';
part 'vegetable.freezed.dart';
part 'vegetable.g.dart';

@freezed
class Vegetable with _$Vegetable {
  const factory Vegetable({
    required String name,
    required String color,
    required String season,
  }) = _Vegetable;
  factory Vegetable.fromJson(Map<String, dynamic> json) =>
      _$VegetableFromJson(json);
}
