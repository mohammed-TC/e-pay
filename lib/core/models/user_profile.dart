import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

/// Demo user profile — product.md A6, pre-seeded after OTP.
@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String fullName,
    required String mobileNumber,
    String? email,
    String? avatarUrl,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
