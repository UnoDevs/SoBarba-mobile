import 'package:sobarba_mobile/data/datasources/auth_datasource.dart';

class AuthRepository {

  final AuthDatasource _authDatasource = new AuthDatasource();
  
  Future<String> getToken(String email, String password) async {
    final response = _authDatasource.getToken(email, password);
    return response['access_token'];
  }
}