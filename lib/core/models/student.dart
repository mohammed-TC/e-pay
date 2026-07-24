import 'package:freezed_annotation/freezed_annotation.dart';

import 'money.dart';

part 'student.freezed.dart';
part 'student.g.dart';

/// An enrolled student with an outstanding fee — product.md H2.
@freezed
abstract class Student with _$Student {
  const factory Student({
    required String id,
    required String institutionId,
    required String name,
    required Money outstandingFee,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
}
