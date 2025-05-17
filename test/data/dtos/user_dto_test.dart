
import 'package:flutter_faculdade_v1/data/dtos/user_dto.dart';
import 'package:flutter_faculdade_v1/domain/entities/user.dart';
import 'package:test/test.dart';

void main(){

  UserDto dto = UserDto(id: 1,name: "Felipe dos Santos", email: "felipe@email.com",password: "Senha123");

  test('convert Scheduling DTO to entity', (){
    User entity = dto.toEntity();
    expect(entity, isA<User>());
    expect(entity.email,isNotNull);
    expect(entity.name,equals('Felipe dos Santos'));
  });


}