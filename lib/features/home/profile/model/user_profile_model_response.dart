import 'dart:convert';
import 'package:meetmax/features/home/profile/model/user_profile_model.dart';

class UserProfileModelResponse {
  final UserProfileModel? profile;

  UserProfileModelResponse({
    this.profile,
  });

  UserProfileModelResponse copyWith({
    UserProfileModel? profile,
  }) =>
      UserProfileModelResponse(
        profile: profile ?? this.profile,
      );

  factory UserProfileModelResponse.fromJson(String str) =>
      UserProfileModelResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserProfileModelResponse.fromMap(Map<String, dynamic> json) =>
      UserProfileModelResponse(
        profile: json["profile"] == null
            ? null
            : UserProfileModel.fromMap(json["profile"]),
      );

  Map<String, dynamic> toMap() => {
        "profile": profile?.toJson(),
      };
}
