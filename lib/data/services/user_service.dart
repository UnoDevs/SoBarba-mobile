import 'dart:convert';

import 'package:flutter_faculdade_v1/data/dtos/user_dto.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<UserDto?> fetchUserAuth(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.200.107:8080/user/auth'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      final dynamic json = jsonDecode(response.body);
      return UserDto.fromJson(json);
    }
    print(response.body);
    return null;
  }
}
