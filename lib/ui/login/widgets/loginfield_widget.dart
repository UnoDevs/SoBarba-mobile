import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Icon icon;
  final bool obscureText;
  LoginField({super.key, required this.controller, required this.label, required this.icon,required this.obscureText});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: label,
          prefixIcon:  icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
          ),
        ),
      ),
    );
  }
}