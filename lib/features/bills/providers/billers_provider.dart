import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/biller.dart';
import '../../../data/repositories/bills_repository.dart';

part 'billers_provider.g.dart';

/// All fictional billers, grouped by category on-screen — product.md E1/E2.
@Riverpod(keepAlive: true)
class Billers extends _$Billers {
  @override
  Future<List<Biller>> build() =>
      ref.read(billsRepositoryProvider).fetchBillers();
}
