// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_results_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Vehicle classes priced for [rentalSearchProvider]'s current dates —
/// product.md L2. Business logic lives here, not in the L2 screen
/// (flutter-conventions.md).

@ProviderFor(rentalResults)
final rentalResultsProvider = RentalResultsProvider._();

/// Vehicle classes priced for [rentalSearchProvider]'s current dates —
/// product.md L2. Business logic lives here, not in the L2 screen
/// (flutter-conventions.md).

final class RentalResultsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<RentalResult>>,
          List<RentalResult>,
          FutureOr<List<RentalResult>>
        >
    with
        $FutureModifier<List<RentalResult>>,
        $FutureProvider<List<RentalResult>> {
  /// Vehicle classes priced for [rentalSearchProvider]'s current dates —
  /// product.md L2. Business logic lives here, not in the L2 screen
  /// (flutter-conventions.md).
  RentalResultsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rentalResultsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rentalResultsHash();

  @$internal
  @override
  $FutureProviderElement<List<RentalResult>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<RentalResult>> create(Ref ref) {
    return rentalResults(ref);
  }
}

String _$rentalResultsHash() => r'f639ac9751e39ff623d3d181a3d513a72916b3be';
