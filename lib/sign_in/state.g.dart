// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isSignedInHash() => r'ba212a8252b4faae46e516658f94f35e4ddda3e2';

/// See also [isSignedIn].
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
String _$userIdHash() => r'd879438e405303e0f22a6dbcb556c94729a0e007';

/// See also [userId].
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
String _$userNotifierHash() => r'c03feda8d6584cddde7b40f50e2cfaf5e84682b5';

/// See also [UserNotifier].
@ProviderFor(UserNotifier)
final userNotifierProvider =
    AutoDisposeStreamNotifierProvider<UserNotifier, User?>.internal(
  UserNotifier.new,
  name: r'userNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserNotifier = AutoDisposeStreamNotifier<User?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
