import 'package:flutter_faculdade_v1/domain/entities/user.dart';

class UserDto {
  final int id;
  final String name;
  final String email;
  final String password;

  UserDto({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  User toEntity() {
    return User(id: this.id, name: this.name, email: this.email, password: this.password);
  }
}
