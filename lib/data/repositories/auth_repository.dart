import 'package:sobarba_mobile/data/datasources/auth_datasource.dart';

class AuthRepository {

  final AuthDatasource _authDatasource = new AuthDatasource();
  
  Future<String> getToken(String email, String password) async {
    _authDatasource.getToken(email, password);
    return "";
  }
}