
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sobarba_mobile/src/pages/home/home_page.dart';
import 'package:sobarba_mobile/src/pages/login/widgets/card_form_login_widget.dart';
import 'package:sobarba_mobile/src/pages/utils/widgets/gradient_decoration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  Widget _body() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.asset("assets/imgs/logo.png"),
                ),
                SizedBox(
                  height: 20,
                ),
                CardFormLoginWidget(email: "email@email.com", password: "123"),
              ],
            ),
          ) 
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: GradientDecoration.get(),
          ),
          _body(),
          
        ],
      ),
    );
  }
}