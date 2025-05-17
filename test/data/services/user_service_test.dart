import 'package:flutter_faculdade_v1/data/dtos/user_dto.dart';
import 'package:flutter_faculdade_v1/data/services/user_service.dart';
import 'package:test/test.dart';

void main() {
  UserService userService = UserService();

  test('validar response 200 do fecthUserAuth', () async {
    String email = 'felipe@email.com';
    String password = 'Mudar123@';
    UserDto? user = await userService.fetchUserAuth(email, password);
    expect(user, isA<UserDto>());
  });

  test('validar response diferente de 200 do fecthUserAuth', () async {
    String email = 'invalido@email.com';
    String password = 'invalid@';
    UserDto? user = await userService.fetchUserAuth(email, password);
    expect(user, isNull);
  });

    test('validar dados response 200 do fecthUserAuth', () async {
    String email = 'felipe@email.com';
    String password = 'Mudar123@';
    UserDto? user = await userService.fetchUserAuth(email, password);
    expect(user!.name, isNotNull);
  });


}
