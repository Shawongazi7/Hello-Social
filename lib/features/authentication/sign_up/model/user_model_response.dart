import 'dart:convert';
import 'package:meetmax/features/authentication/sign_up/model/user_model.dart';

class UserAuthModelResponse {
  final bool? success;
  final String? message;
  final UserModel? user;
  final String? token;

  UserAuthModelResponse({
    this.success,
    this.message,
    this.user,
    this.token,
  });

  UserAuthModelResponse copyWith({
    bool? success,
    String? message,
    UserModel? user,
    String? token,
  }) =>
      UserAuthModelResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        user: user ?? this.user,
        token: token ?? this.token,
      );

  factory UserAuthModelResponse.fromJson(String str) =>
      UserAuthModelResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserAuthModelResponse.fromMap(Map<String, dynamic> json) =>
      UserAuthModelResponse(
        success: json["success"],
        message: json["message"],
        user: json["data"]?["user"] == null
            ? null
            : UserModel.fromMap(json["data"]["user"]),
        token: json["data"]?["token"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "user": user?.toJson(),
        "token": token,
      };
}
