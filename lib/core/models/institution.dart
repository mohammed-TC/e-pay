import 'package:freezed_annotation/freezed_annotation.dart';

import 'institution_type.dart';
import 'student.dart';

part 'institution.freezed.dart';
part 'institution.g.dart';

/// A school/university with enrolled students — product.md H1.
@freezed
abstract class Institution with _$Institution {
  const factory Institution({
    required String id,
    required String name,
    required InstitutionType type,
    required List<Student> students,
  }) = _Institution;

  factory Institution.fromJson(Map<String, dynamic> json) =>
      _$InstitutionFromJson(json);
}
