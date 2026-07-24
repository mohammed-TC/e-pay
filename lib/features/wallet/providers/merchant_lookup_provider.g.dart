// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_lookup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Resolves a scanned/typed QR code to a [Merchant] for C5 — `null` when the
/// code isn't recognized (screen falls back to a generic "unknown merchant"
/// entry so the demo never dead-ends on an unrecognized code).

@ProviderFor(merchantLookup)
final merchantLookupProvider = MerchantLookupFamily._();

/// Resolves a scanned/typed QR code to a [Merchant] for C5 — `null` when the
/// code isn't recognized (screen falls back to a generic "unknown merchant"
/// entry so the demo never dead-ends on an unrecognized code).

final class MerchantLookupProvider
    extends
        $FunctionalProvider<
          AsyncValue<Merchant?>,
          Merchant?,
          FutureOr<Merchant?>
        >
    with $FutureModifier<Merchant?>, $FutureProvider<Merchant?> {
  /// Resolves a scanned/typed QR code to a [Merchant] for C5 — `null` when the
  /// code isn't recognized (screen falls back to a generic "unknown merchant"
  /// entry so the demo never dead-ends on an unrecognized code).
  MerchantLookupProvider._({
    required MerchantLookupFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'merchantLookupProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$merchantLookupHash();

  @override
  String toString() {
    return r'merchantLookupProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Merchant?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Merchant?> create(Ref ref) {
    final argument = this.argument as String;
    return merchantLookup(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MerchantLookupProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$merchantLookupHash() => r'cdb613808b93817baa239b0e1b196fe64e8d44a6';

/// Resolves a scanned/typed QR code to a [Merchant] for C5 — `null` when the
/// code isn't recognized (screen falls back to a generic "unknown merchant"
/// entry so the demo never dead-ends on an unrecognized code).

final class MerchantLookupFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Merchant?>, String> {
  MerchantLookupFamily._()
    : super(
        retry: null,
        name: r'merchantLookupProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Resolves a scanned/typed QR code to a [Merchant] for C5 — `null` when the
  /// code isn't recognized (screen falls back to a generic "unknown merchant"
  /// entry so the demo never dead-ends on an unrecognized code).

  MerchantLookupProvider call(String code) =>
      MerchantLookupProvider._(argument: code, from: this);

  @override
  String toString() => r'merchantLookupProvider';
}
