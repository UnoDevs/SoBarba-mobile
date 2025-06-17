import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sobarba_mobile/data/repositories/auth_repository.dart';

class AuthViewmodel extends GetxController {
  final AuthRepository authrepository;
  final RxnString _token = RxnString();
  String? get token => _token.value;

  AuthViewmodel({required this.authrepository});

  Future<void> login(String email, String password) async {
    try {
      final token = await authrepository.getToken(email, password);
      _token.value = token;
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar(
        'Erro ao fazer login',
        'Credenciais invalidas! Tente novamente',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(12),
      );
    }
  }

  void setToken(String token) {
    _token.value = token;
  }

  void logout() {
    _token.value = null;
  }

  bool get isLoggedIn => _token.value != null;
}
