import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';
import 'package:sobarba_mobile/ui/login/pages/login_page.dart';
import 'package:sobarba_mobile/ui/scheduling/pages/schedulingcreate_page.dart';
import 'package:sobarba_mobile/ui/scheduling/pages/schedulinghome_page.dart';

class SoBarbaApp extends StatelessWidget {
  const SoBarbaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SóBarba App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 71, 0, 193)),
        scaffoldBackgroundColor: const Color(0xFFE5E9FF)
      ),
      home: const LoginPage(),
      getPages: [
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/home', page: () => const SchedulingHomePage()),
        GetPage(name: '/create', page: () => const SchedulingCreatePage())
      ],
    );
  }
}