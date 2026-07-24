import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/money.dart';

part 'recharge_plan.freezed.dart';
part 'recharge_plan.g.dart';

/// A prepaid recharge plan card — product.md E6.
@freezed
abstract class RechargePlan with _$RechargePlan {
  const factory RechargePlan({
    required String id,
    required String billerId,
    required String label,
    required String description,
    required Money price,
    required bool isPopular,
  }) = _RechargePlan;

  factory RechargePlan.fromJson(Map<String, dynamic> json) =>
      _$RechargePlanFromJson(json);
}
