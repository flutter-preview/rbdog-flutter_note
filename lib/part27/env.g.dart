// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

class _Env {
  static const List<int> _enviedkeypass1 = [
    2153081097,
    3018846043,
    3087734550,
    1148306709,
    3422425429,
    988632070,
    3192658377,
    1783283791,
    621570482
  ];
  static const List<int> _envieddatapass1 = [
    2153077224,
    3018842111,
    3087738793,
    1148319206,
    3422429587,
    988636322,
    3192662394,
    1783296133,
    621566273
  ];
  static final pass1 = String.fromCharCodes(
    List.generate(_envieddatapass1.length, (i) => i, growable: false)
        .map((i) => _envieddatapass1[i] ^ _enviedkeypass1[i])
        .toList(growable: false),
  );
  static const List<int> _enviedkeypass2 = [
    3313916452,
    1295199183,
    1322533275,
    911428933,
    1313609960
  ];
  static const List<int> _envieddatapass2 = [
    3313920715,
    1295194940,
    1322545487,
    911441337,
    1313613905
  ];
  static final pass2 = String.fromCharCodes(
    List.generate(_envieddatapass2.length, (i) => i, growable: false)
        .map((i) => _envieddatapass2[i] ^ _enviedkeypass2[i])
        .toList(growable: false),
  );
}
