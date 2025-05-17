import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final void Function() callBack;
  const LoginButton ({super.key, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: callBack,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45)
          ),
        ),
        child: Text(
          'Login',
          style: TextStyle(
            color: const Color.fromARGB(255, 21, 78, 175),
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}