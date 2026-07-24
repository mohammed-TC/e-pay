// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Mock contacts for Send/Request Money — product.md C3/C4.

@ProviderFor(WalletContacts)
final walletContactsProvider = WalletContactsProvider._();

/// Mock contacts for Send/Request Money — product.md C3/C4.
final class WalletContactsProvider
    extends $AsyncNotifierProvider<WalletContacts, List<WalletContact>> {
  /// Mock contacts for Send/Request Money — product.md C3/C4.
  WalletContactsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'walletContactsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$walletContactsHash();

  @$internal
  @override
  WalletContacts create() => WalletContacts();
}

String _$walletContactsHash() => r'bde4d1f535c086e0868cf19de3e17fb5db329442';

/// Mock contacts for Send/Request Money — product.md C3/C4.

abstract class _$WalletContacts extends $AsyncNotifier<List<WalletContact>> {
  FutureOr<List<WalletContact>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<WalletContact>>, List<WalletContact>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<WalletContact>>, List<WalletContact>>,
              AsyncValue<List<WalletContact>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
