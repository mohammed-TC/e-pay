// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_pricing_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(rentalPricing)
final rentalPricingProvider = RentalPricingProvider._();

final class RentalPricingProvider
    extends
        $FunctionalProvider<
          AsyncValue<RentalPricingBreakdown>,
          RentalPricingBreakdown,
          FutureOr<RentalPricingBreakdown>
        >
    with
        $FutureModifier<RentalPricingBreakdown>,
        $FutureProvider<RentalPricingBreakdown> {
  RentalPricingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rentalPricingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rentalPricingHash();

  @$internal
  @override
  $FutureProviderElement<RentalPricingBreakdown> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<RentalPricingBreakdown> create(Ref ref) {
    return rentalPricing(ref);
  }
}

String _$rentalPricingHash() => r'a03a14e3e8cd7bf9203392e790523ead593fdd68';
