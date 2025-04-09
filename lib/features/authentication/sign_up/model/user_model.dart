import 'dart:convert';

class UserModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? dateOfBirth;
  final String? gender;
  final String? email;
  final String? phone;
  final String? otp;
  final String? profilePicture;
  final String? coverPhoto;
  final String? bio;
  final bool? isRegistered;
  final bool? isVerified;
  final bool? isBanned;
  final String? address;
  final String? relationship;
  final String? hometown;
  final String? work;
  final String? education;
  final bool? isActive;
  final String? lastActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.email,
    this.phone,
    this.otp,
    this.profilePicture,
    this.coverPhoto,
    this.bio,
    this.isRegistered,
    this.isVerified,
    this.isBanned,
    this.address,
    this.relationship,
    this.hometown,
    this.work,
    this.education,
    this.isActive,
    this.lastActive,
    this.createdAt,
    this.updatedAt,
  });

  UserModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? dateOfBirth,
    String? gender,
    String? email,
    String? phone,
    String? otp,
    String? profilePicture,
    String? coverPhoto,
    String? bio,
    bool? isRegistered,
    bool? isVerified,
    bool? isBanned,
    String? address,
    String? relationship,
    String? hometown,
    String? work,
    String? education,
    bool? isActive,
    String? lastActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      UserModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        gender: gender ?? this.gender,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        otp: otp ?? this.otp,
        profilePicture: profilePicture ?? this.profilePicture,
        coverPhoto: coverPhoto ?? this.coverPhoto,
        bio: bio ?? this.bio,
        isRegistered: isRegistered ?? this.isRegistered,
        isVerified: isVerified ?? this.isVerified,
        isBanned: isBanned ?? this.isBanned,
        address: address ?? this.address,
        relationship: relationship ?? this.relationship,
        hometown: hometown ?? this.hometown,
        work: work ?? this.work,
        education: education ?? this.education,
        isActive: isActive ?? this.isActive,
        lastActive: lastActive ?? this.lastActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        dateOfBirth: json["dateOfBirth"],
        gender: json["gender"],
        email: json["email"],
        phone: json["phone"],
        otp: json["otp"],
        profilePicture: json["profilePicture"],
        coverPhoto: json["coverPhoto"],
        bio: json["bio"],
        isRegistered: json["isRegistered"],
        isVerified: json["isVerified"],
        isBanned: json["isBanned"],
        address: json["address"],
        relationship: json["relationship"],
        hometown: json["hometown"],
        work: json["work"],
        education: json["education"],
        isActive: json["isActive"],
        lastActive: json["lastActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]).toLocal(),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]).toLocal(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
        "email": email,
        "phone": phone,
        "otp": otp,
        "profilePicture": profilePicture,
        "coverPhoto": coverPhoto,
        "bio": bio,
        "isRegistered": isRegistered,
        "isVerified": isVerified,
        "isBanned": isBanned,
        "address": address,
        "relationship": relationship,
        "hometown": hometown,
        "work": work,
        "education": education,
        "isActive": isActive,
        "lastActive": lastActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
