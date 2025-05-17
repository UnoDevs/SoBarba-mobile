import 'package:flutter/material.dart';

class SchedulingAppBar extends StatelessWidget{
  final void Function() callback;
  final String userName;
  
  SchedulingAppBar({super.key, required this.callback, required this.userName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Row(
          children: [
            Icon(Icons.account_circle,  color: Color(0xFF4B00FF),size: 50,),
            Text(userName)
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle, color: Color(0xFF4B00FF), size: 50),
            onPressed: callback,
          ),
        ],
      );
  }
}