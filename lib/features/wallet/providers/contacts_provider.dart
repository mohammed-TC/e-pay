import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/wallet_repository.dart';
import '../models/wallet_contact.dart';

part 'contacts_provider.g.dart';

/// Mock contacts for Send/Request Money — product.md C3/C4.
@Riverpod(keepAlive: true)
class WalletContacts extends _$WalletContacts {
  @override
  Future<List<WalletContact>> build() =>
      ref.read(walletRepositoryProvider).fetchContacts();
}
