// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isSignedInHash() => r'41c1a5feec7a3b3b336cac8c3c235dee761c7236';

///
/// サインイン中かどうか
///   - true: サインイン中
///   - false: サインアウト中
///   - null: 不明
///
///
/// Copied from [isSignedIn].
@ProviderFor(isSignedIn)
final isSignedInProvider = AutoDisposeProvider<bool?>.internal(
  isSignedIn,
  name: r'isSignedInProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isSignedInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsSignedInRef = AutoDisposeProviderRef<bool?>;
String _$userIdHash() => r'bb453a6ce3b98cc3c904d9b028e30554b426ccd5';

///
/// ユーザーID
///
///
/// Copied from [userId].
@ProviderFor(userId)
final userIdProvider = AutoDisposeProvider<String>.internal(
  userId,
  name: r'userIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserIdRef = AutoDisposeProviderRef<String>;
String _$firebaseUserNotifierHash() =>
    r'bf3a0d9d05416db3fbaf1ace018fbbf3ad36d20c';

///
/// Firebaseのユーザーを管理するノティファイヤー
///
///
/// Copied from [FirebaseUserNotifier].
@ProviderFor(FirebaseUserNotifier)
final firebaseUserNotifierProvider =
    AutoDisposeStreamNotifierProvider<FirebaseUserNotifier, User?>.internal(
  FirebaseUserNotifier.new,
  name: r'firebaseUserNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseUserNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FirebaseUserNotifier = AutoDisposeStreamNotifier<User?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
