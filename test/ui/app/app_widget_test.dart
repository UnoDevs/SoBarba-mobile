import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:sobarba_mobile/ui/app/app_widget.dart';

void main() {
  testWidgets('App deve iniciar e renderizar LoginPage', (WidgetTester tester) async {
    await tester.pumpWidget(const SoBarbaApp());

    await tester.pumpAndSettle();

    expect(find.text('Login'), findsOneWidget);

    
    expect(find.byType(TextField), findsWidgets);
  });
}