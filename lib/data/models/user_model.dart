class UserModel {
  final int id;
  final String name;
  final String email;
  final String updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'updated_at': updatedAt,
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      updatedAt: map['updated_at'],
    );
  }
}
