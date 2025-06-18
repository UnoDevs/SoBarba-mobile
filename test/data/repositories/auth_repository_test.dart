import 'package:flutter_test/flutter_test.dart';

// Simula a estrutura do AuthDatasource
class FakeAuthDatasource {
  Future<Map<String, dynamic>> getToken(String email, String password) async {
    if (email == 'teste@teste.com' && password == '123') {
      return {'accessToken': 'fake_token_123'};
    } else {
      throw Exception('Login inválido');
    }
  }
}

// Versão testável do AuthRepository que usa um datasource injetável
class AuthRepository {
  final FakeAuthDatasource _authDatasource;

  AuthRepository(this._authDatasource);

  Future<String> getToken(String email, String password) async {
    final response = await _authDatasource.getToken(email, password);
    return response['accessToken'];
  }
}

void main() {
  group('AuthRepository', () {
    late AuthRepository repository;

    setUp(() {
      repository = AuthRepository(FakeAuthDatasource());
    });

    test('deve retornar o token corretamente com credenciais válidas', () async {
      final token = await repository.getToken('teste@teste.com', '123');
      expect(token, equals('fake_token_123'));
    });

    test('deve lançar exceção se credenciais forem inválidas', () async {
      expect(
        () async => await repository.getToken('errado@teste.com', 'senha'),
        throwsException,
      );
    });
  });
}