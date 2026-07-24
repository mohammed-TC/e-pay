// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Auth lifecycle — architecture.md §3 `authStateProvider`. `app_router.dart`'s
/// redirect listens to this. Named `AppAuthState` (see `AppLocale` in
/// `app/locale_provider.dart`) since `AuthState` is already the state model.

@ProviderFor(AppAuthState)
final appAuthStateProvider = AppAuthStateProvider._();

/// Auth lifecycle — architecture.md §3 `authStateProvider`. `app_router.dart`'s
/// redirect listens to this. Named `AppAuthState` (see `AppLocale` in
/// `app/locale_provider.dart`) since `AuthState` is already the state model.
final class AppAuthStateProvider
    extends $NotifierProvider<AppAuthState, AuthState> {
  /// Auth lifecycle — architecture.md §3 `authStateProvider`. `app_router.dart`'s
  /// redirect listens to this. Named `AppAuthState` (see `AppLocale` in
  /// `app/locale_provider.dart`) since `AuthState` is already the state model.
  AppAuthStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appAuthStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appAuthStateHash();

  @$internal
  @override
  AppAuthState create() => AppAuthState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthState>(value),
    );
  }
}

String _$appAuthStateHash() => r'6cf334be730e32c78e36935a25a747755897e034';

/// Auth lifecycle — architecture.md §3 `authStateProvider`. `app_router.dart`'s
/// redirect listens to this. Named `AppAuthState` (see `AppLocale` in
/// `app/locale_provider.dart`) since `AuthState` is already the state model.

abstract class _$AppAuthState extends $Notifier<AuthState> {
  AuthState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AuthState, AuthState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthState, AuthState>,
              AuthState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
