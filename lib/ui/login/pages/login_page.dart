import 'package:flutter/material.dart';
import 'package:flutter_faculdade_v1/ui/login/view_models/login_viewmodel.dart';
import 'package:flutter_faculdade_v1/ui/login/widgets/loginbutton_widget.dart';
import 'package:flutter_faculdade_v1/ui/login/widgets/loginfield_widget.dart';
import 'package:flutter_faculdade_v1/ui/login/widgets/logo_widget.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewmodel>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(220, 2, 2, 78),
              Color.fromARGB(221, 13, 13, 236),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LogoWidget(),
                  LoginField(controller: viewModel.emailController, label: 'E-mail',icon: Icon(Icons.email),obscureText: false,),
                  LoginField(controller: viewModel.passwordController, label: 'Password', icon: Icon(Icons.lock), obscureText: true,),
                  LoginButton(callBack:() => viewModel.login(context))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
