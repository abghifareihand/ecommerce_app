import 'dart:convert';

AuthResponseModel authResponseModelFromJson(String str) =>
    AuthResponseModel.fromJson(json.decode(str));

String authResponseModelToJson(AuthResponseModel data) =>
    json.encode(data.toJson());

class AuthResponseModel {
  final Data data;

  AuthResponseModel({
    required this.data,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  final String accessToken;
  final String tokenType;
  final User user;

  Data({
    required this.accessToken,
    required this.tokenType,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "user": user.toJson(),
      };
}

class User {
  final int id;
  final String name;
  final String email;
  final String username;
  final String phone;
  final String roles;
  // final dynamic emailVerifiedAt;
  // final dynamic currentTeamId;
  // final dynamic profilePhotoPath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String profilePhotoUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.roles,
    // required this.emailVerifiedAt,
    // required this.currentTeamId,
    // required this.profilePhotoPath,
    required this.createdAt,
    required this.updatedAt,
    required this.profilePhotoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        username: json["username"],
        phone: json["phone"] ?? '',
        roles: json["roles"] ?? '',
        // emailVerifiedAt: json["email_verified_at"] ?? '',
        // currentTeamId: json["current_team_id"] ?? '',
        // profilePhotoPath: json["profile_photo_path"] ?? '',
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        profilePhotoUrl: json["profile_photo_url"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "username": username,
        "phone": phone,
        "roles": roles,
        // "email_verified_at": emailVerifiedAt,
        // "current_team_id": currentTeamId,
        // "profile_photo_path": profilePhotoPath,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "profile_photo_url": profilePhotoUrl,
      };
}
