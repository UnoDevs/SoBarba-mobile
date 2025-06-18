import 'package:flutter/material.dart';

class SchedulingDrawer extends StatelessWidget {
  final VoidCallback onLogout;

  const SchedulingDrawer({super.key, required this.onLogout});

  @override
Widget build(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        const UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xFF0024D4),
          ),
          accountName: Text('Usuário UnoDevs'),
          accountEmail: Text('projetosunodevs@gmail.com'),
          currentAccountPicture: CircleAvatar(
          
          ),
        ),
        ListTile(
          leading: const Icon(Icons.schedule, color: Color(0xFF0024D4)),
          title: const Text('Agendamentos'),
          onTap: () => Navigator.pop(context),
        ),
        const Spacer(),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.red),
          title: const Text(
            'Sair',
            style: TextStyle(color: Colors.red),
          ),
          onTap: onLogout,
        ),
      ],
    ),
  );
}
}