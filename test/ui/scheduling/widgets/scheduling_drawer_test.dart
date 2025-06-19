import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sobarba_mobile/ui/scheduling/widgets/scheduling_drawer.dart';

void main() {
  group('SchedulingDrawer', () {
    testWidgets('Deve exibir as informações da conta do usuário', (WidgetTester tester) async {
      final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            key: scaffoldKey,
            drawer: SchedulingDrawer(onLogout: () {}),
          ),
        ),
      );

      scaffoldKey.currentState?.openDrawer();
      await tester.pumpAndSettle();

      expect(find.text('Usuário UnoDevs'), findsOneWidget);
      expect(find.text('projetosunodevs@gmail.com'), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('Deve exibir as opções "Agendamentos" e "Sair"', (WidgetTester tester) async {
      final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            key: scaffoldKey,
            drawer: SchedulingDrawer(onLogout: () {}),
          ),
        ),
      );

      scaffoldKey.currentState?.openDrawer();
      await tester.pumpAndSettle();

      expect(find.text('Agendamentos'), findsOneWidget);
      expect(find.text('Sair'), findsOneWidget);
      expect(find.byIcon(Icons.schedule), findsOneWidget);
      expect(find.byIcon(Icons.logout), findsOneWidget);
    });

    testWidgets('Tocar em "Agendamentos" deve fechar o drawer', (WidgetTester tester) async {
      final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            key: scaffoldKey,
            drawer: SchedulingDrawer(onLogout: () {}),
          ),
        ),
      );

      scaffoldKey.currentState?.openDrawer();
      await tester.pumpAndSettle();

      expect(find.text('Agendamentos'), findsOneWidget);

      await tester.tap(find.text('Agendamentos'));
      await tester.pumpAndSettle();

      expect(find.text('Agendamentos'), findsNothing);
    });

    testWidgets('Tocar em "Sair" deve chamar o callback onLogout', (WidgetTester tester) async {
      bool logoutChamado = false;
      final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            key: scaffoldKey,
            drawer: SchedulingDrawer(onLogout: () {
              logoutChamado = true;
            }),
          ),
        ),
      );

      scaffoldKey.currentState?.openDrawer();
      await tester.pumpAndSettle();

      expect(find.text('Sair'), findsOneWidget);

      await tester.tap(find.text('Sair'));
      await tester.pumpAndSettle();

      expect(logoutChamado, isTrue);
    });
  });
}