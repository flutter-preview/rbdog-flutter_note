// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userHash() => r'3815939be9d053500acaa437c0f23d0d03392781';

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
String _$isSignedInHash() => r'49bf32b5bbaa2d237e6c626128fe5eb51d8d8954';

///
/// サインイン中かどうか
///
///
/// Copied from [isSignedIn].
@ProviderFor(isSignedIn)
final isSignedInProvider = AutoDisposeProvider<bool>.internal(
  isSignedIn,
  name: r'isSignedInProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isSignedInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsSignedInRef = AutoDisposeProviderRef<bool>;
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
