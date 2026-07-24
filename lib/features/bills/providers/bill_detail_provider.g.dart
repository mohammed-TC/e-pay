// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Fetches the current bill for a saved/new account — product.md E5.
/// Mirrors `merchant_lookup_provider.dart`'s family-provider shape.

@ProviderFor(billDetail)
final billDetailProvider = BillDetailFamily._();

/// Fetches the current bill for a saved/new account — product.md E5.
/// Mirrors `merchant_lookup_provider.dart`'s family-provider shape.

final class BillDetailProvider
    extends $FunctionalProvider<AsyncValue<Bill>, Bill, FutureOr<Bill>>
    with $FutureModifier<Bill>, $FutureProvider<Bill> {
  /// Fetches the current bill for a saved/new account — product.md E5.
  /// Mirrors `merchant_lookup_provider.dart`'s family-provider shape.
  BillDetailProvider._({
    required BillDetailFamily super.from,
    required BillerAccount super.argument,
  }) : super(
         retry: null,
         name: r'billDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$billDetailHash();

  @override
  String toString() {
    return r'billDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Bill> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Bill> create(Ref ref) {
    final argument = this.argument as BillerAccount;
    return billDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BillDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$billDetailHash() => r'ed04c9ce9c6451588d7e5223bcd52c7c6d677ebf';

/// Fetches the current bill for a saved/new account — product.md E5.
/// Mirrors `merchant_lookup_provider.dart`'s family-provider shape.

final class BillDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Bill>, BillerAccount> {
  BillDetailFamily._()
    : super(
        retry: null,
        name: r'billDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Fetches the current bill for a saved/new account — product.md E5.
  /// Mirrors `merchant_lookup_provider.dart`'s family-provider shape.

  BillDetailProvider call(BillerAccount account) =>
      BillDetailProvider._(argument: account, from: this);

  @override
  String toString() => r'billDetailProvider';
}
