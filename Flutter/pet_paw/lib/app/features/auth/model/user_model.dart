class UserModel {
  final String userId;
  final String token;
  final String? name;
  final String? email;

  UserModel({
    required this.userId,
    required this.token,
    this.name,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['id']?.toString() ?? json['userId']?.toString() ?? '',
      token: json['token'] ?? '',
      name: json['name'],
      email: json['email'],
    );
  }
}
