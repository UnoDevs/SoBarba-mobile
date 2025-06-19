import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:sobarba_mobile/ui/login/pages/login_page.dart';

class FakeAuthRepository {
  Future<String> getToken(String email, String password) async {
    if (email == 'teste@teste.com' && password == '123') {
      return 'fake_token';
    }
    throw Exception('Login inválido');
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;

  testWidgets('Renderiza campos e botão de login corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(home: LoginPage()));

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('Permite digitar email e senha', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(home: LoginPage()));

    
    await tester.enterText(find.byType(TextField).at(0), 'teste@teste.com');
  
    await tester.enterText(find.byType(TextField).at(1), '123');

    final emailField = tester.widget<TextField>(find.byType(TextField).at(0));
    final passwordField = tester.widget<TextField>(find.byType(TextField).at(1));

    expect(emailField.controller?.text, 'teste@teste.com');
    expect(passwordField.controller?.text, '123');
  });
}