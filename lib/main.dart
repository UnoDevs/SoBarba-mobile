import 'package:flutter/material.dart';
import 'package:flutter_faculdade_v1/ui/login/pages/login_page.dart';
import 'package:flutter_faculdade_v1/ui/login/view_models/login_viewmodel.dart';
import 'package:flutter_faculdade_v1/ui/scheduling/pages/scheduling_page.dart';
import 'package:flutter_faculdade_v1/ui/scheduling/pages/schedulingcreate_page.dart';
import 'package:flutter_faculdade_v1/ui/scheduling/view_models/scheduling_viewmodel.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const SoBarbaApp());
}

class SoBarbaApp extends StatelessWidget {
  const SoBarbaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: 
    [
      ChangeNotifierProvider(create:(_) => LoginViewmodel()),
      ChangeNotifierProvider(create:(_) => SchedulingViewModel())
    ],
    child: MaterialApp( 
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginView(),
        '/scheduling': (context) => SchedulingView(),
        '/scheduling/create': (context) => SchedulingCreateView()
      },
    ),
    );
  }
}