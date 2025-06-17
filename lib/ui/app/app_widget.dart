import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sobarba_mobile/ui/login/pages/login_page.dart';

class SoBarbaApp extends StatelessWidget {
  const SoBarbaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginPage(),
    );
  }
}