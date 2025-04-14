import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sobarba_mobile/src/pages/utils/widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
     return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  int count = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Contador: $count"),
            Container(height: 50,),
          ],
        ),
      ), 

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
            setState(() {
              count++;
              print("clicado: $count");
            }

          );

        }

      ),

    );

  }

}