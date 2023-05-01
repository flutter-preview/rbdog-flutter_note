// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userHash() => r'2cf254520bccdca1749af1634de7c92e9ea344a4';

///
/// ユーザー
///
///
/// Copied from [user].
@ProviderFor(user)
final userProvider = AutoDisposeProvider<User?>.internal(
  user,
  name: r'userProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRef = AutoDisposeProviderRef<User?>;
String _$signedInHash() => r'ad977544c865550a5f87cfb21ad0a59169bcdd7b';

///
/// サインイン中かどうか
///
///
/// Copied from [signedIn].
@ProviderFor(signedIn)
final signedInProvider = AutoDisposeProvider<bool>.internal(
  signedIn,
  name: r'signedInProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signedInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignedInRef = AutoDisposeProviderRef<bool>;
String _$userIdHash() => r'b04b6e432625c4a9d6c9643e7f6182a7c53ec8c2';

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
