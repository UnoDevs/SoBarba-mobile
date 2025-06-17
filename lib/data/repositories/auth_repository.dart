import 'package:sobarba_mobile/data/datasources/auth_datasource.dart';

class AuthRepository {

  final AuthDatasource _authDatasource = new AuthDatasource();
  
  Future<String> getToken(String email, String password) async {
    final response = await _authDatasource.getToken(email, password);
    return response['accessToken'];
  }
}