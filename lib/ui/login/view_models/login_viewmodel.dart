import 'package:flutter/material.dart';
import 'package:flutter_faculdade_v1/data/dtos/user_dto.dart';
import 'package:flutter_faculdade_v1/data/services/user_service.dart';
import 'package:flutter_faculdade_v1/domain/entities/user.dart';

class LoginViewmodel extends ChangeNotifier{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final UserService _userService = UserService();
  User? connectedUser;


  Future<bool> login(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    

    UserDto? response = (await _userService.fetchUserAuth(email, password));

    //VALIDAÇÕES
    if(response != null){
      connectedUser = response.toEntity();
      notifyListeners();

      Navigator.pushReplacementNamed(context, '/scheduling');
      return true;
    }
    notifyListeners();
    print('Usuário Invalido');
    return false;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}