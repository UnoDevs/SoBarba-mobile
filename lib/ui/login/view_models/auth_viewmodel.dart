import 'package:get/get.dart';
import 'package:sobarba_mobile/data/repositories/auth_repository.dart';

class AuthViewmodel extends GetxController{
  final AuthRepository authrepository;
  final RxnString _token = RxnString();
  String? get token => _token.value;

  AuthViewmodel({required this.authrepository});

  Future<void> login(String email, String password) async {
    final token = await authrepository.getToken(email,password);
    _token.value = token;
  }

  void setToken(String token){
    _token.value = token;
  }

  void logout() {
    _token.value = null;
  }

  bool get isLoggedIn => _token.value != null;
}