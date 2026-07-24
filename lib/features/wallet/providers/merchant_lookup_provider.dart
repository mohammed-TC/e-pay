import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/wallet_repository.dart';
import '../models/merchant.dart';

part 'merchant_lookup_provider.g.dart';

/// Resolves a scanned/typed QR code to a [Merchant] for C5 — `null` when the
/// code isn't recognized (screen falls back to a generic "unknown merchant"
/// entry so the demo never dead-ends on an unrecognized code).
@riverpod
Future<Merchant?> merchantLookup(Ref ref, String code) =>
    ref.read(walletRepositoryProvider).lookupMerchant(code);
