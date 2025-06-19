import 'package:flutter_test/flutter_test.dart';
import 'package:sobarba_mobile/ui/login/view_models/auth_viewmodel.dart';

import 'package:sobarba_mobile/data/repositories/auth_repository.dart';

class FakeAuthRepository implements AuthRepository {
  @override
  Future<String> getToken(String email, String password) async {
    if (email == 'teste@teste.com' && password == '123') {
      return 'fake_token_123';
    }
    throw Exception('Credenciais inválidas');
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized(); 
  late AuthViewmodel viewModel;

  setUp(() {
    viewModel = AuthViewmodel(authrepository: FakeAuthRepository());
  });

  test('setToken deve definir o token corretamente', () {
    viewModel.setToken('123');
    expect(viewModel.token, equals('123'));
    expect(viewModel.isLoggedIn, isTrue);
  });

  test('logout deve limpar o token', () {
    viewModel.setToken('123');
    viewModel.logout();
    expect(viewModel.token, isNull);
    expect(viewModel.isLoggedIn, isFalse);
  });
}