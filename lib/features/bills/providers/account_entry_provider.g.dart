// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_entry_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Autodispose: fresh per push of the account entry screen.

@ProviderFor(AccountEntryForm)
final accountEntryFormProvider = AccountEntryFormProvider._();

/// Autodispose: fresh per push of the account entry screen.
final class AccountEntryFormProvider
    extends $NotifierProvider<AccountEntryForm, AccountEntryState> {
  /// Autodispose: fresh per push of the account entry screen.
  AccountEntryFormProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accountEntryFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accountEntryFormHash();

  @$internal
  @override
  AccountEntryForm create() => AccountEntryForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AccountEntryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AccountEntryState>(value),
    );
  }
}

String _$accountEntryFormHash() => r'2ea55b6f7768d83964c4fa6b3a6e3dfac732f495';

/// Autodispose: fresh per push of the account entry screen.

abstract class _$AccountEntryForm extends $Notifier<AccountEntryState> {
  AccountEntryState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AccountEntryState, AccountEntryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AccountEntryState, AccountEntryState>,
              AccountEntryState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
