import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("User"),
            accountEmail: Text("email@emai.com"),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 53, 53, 237),
            ) 
            // currentAccountPicture: ClipOval(
            //   child: Image.asset(""),
            // ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/home");
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_month),
            title: Text("Agendamentos"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/agendamentos");
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/login");
            },
          ),

        ],
      ),
    );
  }
}

