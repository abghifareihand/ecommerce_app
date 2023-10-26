class UserResponseModel {
  final int id;
  final String name;
  final String email;
  final String username;
  // final String phone;
  final String roles;
  // final dynamic emailVerifiedAt;
  // final dynamic currentTeamId;
  // final dynamic profilePhotoPath;
  // final DateTime createdAt;
  // final DateTime updatedAt;
  final String profilePhotoUrl;

  UserResponseModel({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    // required this.phone,
    required this.roles,
    // required this.emailVerifiedAt,
    // required this.currentTeamId,
    // required this.profilePhotoPath,
    // required this.createdAt,
    // required this.updatedAt,
    required this.profilePhotoUrl,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) => UserResponseModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        username: json["username"] ?? '',
        // phone: json["phone"] ?? '',
        roles: json["roles"] ?? '',
        // emailVerifiedAt: json["email_verified_at"] ?? '',
        // currentTeamId: json["current_team_id"] ?? '',
        // profilePhotoPath: json["profile_photo_path"] ?? '',
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        profilePhotoUrl: json["profile_photo_url"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "username": username,
        // "phone": phone,
        "roles": roles,
        // "email_verified_at": emailVerifiedAt,
        // "current_team_id": currentTeamId,
        // "profile_photo_path": profilePhotoPath,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
        "profile_photo_url": profilePhotoUrl,
      };
}
