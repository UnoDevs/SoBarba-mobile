import 'package:flutter/material.dart';
import 'package:sobarba_mobile/src/pages/agendamentos/agendamentos_cadastro/agendamentos_cadastro_page.dart';
import 'package:sobarba_mobile/src/pages/agendamentos/agendamentos_page.dart';
import 'package:sobarba_mobile/src/pages/home/home_page.dart';
import 'package:sobarba_mobile/src/pages/login/login_page.dart';

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => LoginPage(),
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/agendamentos": (context) => AgendamentosPage(),
        "/agendamentos/cadastro": (context) => AgendamentosCadastroPage(),
      },
    );
  }
}