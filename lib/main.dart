import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:sobarba_mobile/data/repositories/auth_repository.dart';
import 'package:sobarba_mobile/ui/app/app_widget.dart';
import 'package:sobarba_mobile/ui/login/view_models/auth_viewmodel.dart';

void main() {
  Get.put(AuthViewmodel(authrepository: AuthRepository()));
  runApp(const SoBarbaApp());
}



