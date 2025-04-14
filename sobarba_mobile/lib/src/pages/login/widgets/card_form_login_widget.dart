
import 'package:flutter/material.dart';


class CardFormLoginWidget extends StatelessWidget {
  final String email;
  final String password;
  const CardFormLoginWidget({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    String email = this.email;
    String password = this.password;
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                email = text;
              },
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 42)
              ),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255,255, 255, 255),
                prefixIcon: Icon(Icons.email),
                prefixIconColor: Color.fromARGB(255,184, 184, 214),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(50.0))
                ),
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Color.fromARGB(255,184, 184, 214)
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (text) {
                password = text;
              },
              obscureText: true,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 42)
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.lock_rounded),
                prefixIconColor: Color.fromARGB(255,184, 184, 214),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(50.0))
                  ),
                labelText: "Senha",
                labelStyle: TextStyle(
                  // Color.fromARGB(255,255, 255, 255)
                  color: Color.fromARGB(255,184, 184, 214)
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 15),
                textStyle: TextStyle(fontSize: 20.0),
                backgroundColor: Color.fromARGB(255,255, 255, 255),
                foregroundColor: Color.fromARGB(255, 53, 53, 237)
              ),
              onPressed: () {
                if (email == "email@email.com" && password == "123") {
                  Navigator.of(context).pushReplacementNamed('/home');
                }
              }, 
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}