// 他のファイルに書いた Vegetable を使うために import
import 'package:flutter_sample/part19/vegetable.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String title,
    required int calories,
    required List<Vegetable> vegetables,
  }) = _Recipe;
  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
