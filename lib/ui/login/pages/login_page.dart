import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sobarba_mobile/data/repositories/auth_repository.dart';
import 'package:sobarba_mobile/ui/login/view_models/auth_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final AuthViewmodel _authViewmodel;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authViewmodel = AuthViewmodel(authrepository: AuthRepository());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0024D4), Color(0xFF3366FF)],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/config/assets/LogoSoBarba.png'),
            const SizedBox(height: 32),
            _buildTextField(
              hint: 'E-mail',
              icon: Icons.email_outlined,
              onChanged: (value) => {},
              controller: emailController
            ),
            const SizedBox(height: 32),
            _buildTextField(
              hint: 'Senha',
              icon: Icons.lock_outline,
              onChanged: (value) => {},
              controller: passwordController,
              obscure: true
            ),
            const SizedBox(height: 32),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => {_authViewmodel.login(emailController.text, passwordController.text)},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    bool obscure = false,
    required Function(String) onChanged,
    required TextEditingController controller
  }) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white),
        filled: true,
        fillColor: Colors.white12,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
