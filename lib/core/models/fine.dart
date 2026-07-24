import 'package:freezed_annotation/freezed_annotation.dart';

import 'money.dart';

part 'fine.freezed.dart';
part 'fine.g.dart';

/// A traffic fine — product.md F2.
@freezed
abstract class Fine with _$Fine {
  const factory Fine({
    required String id,
    required String plateNumber,
    required String description,
    required Money amount,
    required DateTime issuedDate,
    required String location,
  }) = _Fine;

  factory Fine.fromJson(Map<String, dynamic> json) => _$FineFromJson(json);
}
