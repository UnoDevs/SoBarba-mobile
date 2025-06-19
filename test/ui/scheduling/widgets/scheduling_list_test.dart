import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sobarba_mobile/domain/entities/person.dart';
import 'package:sobarba_mobile/domain/entities/scheduling.dart';
import 'package:sobarba_mobile/domain/entities/scheduling_item.dart';
import 'package:sobarba_mobile/ui/scheduling/widgets/scheduling_list.dart'; 

void main() {
  final Person mockClient = Person(
    id: 1,
    name: 'João Cliente',
    description: 'Um cliente fiel',
    email: 'joao.cliente@example.com',
    phone: '11987654321',
    active: true,
    document: '123.456.789-00',
    personTypes: ['CLIENT'],
    employeeData: null, 
  );

  final Person mockBarber = Person(
    id: 2,
    name: 'Pedro Barbeiro',
    description: 'Barbeiro experiente',
    email: 'pedro.barbeiro@example.com',
    phone: '11998765432',
    active: true,
    document: '000.111.222-33',
    personTypes: ['EMPLOYEE'],
    employeeData: null, 
  );

  final Person mockClient2 = Person(
    id: 3,
    name: 'Maria Cliente',
    description: 'Nova cliente',
    email: 'maria.cliente@example.com',
    phone: '11912345678',
    active: true,
    document: '444.555.666-77',
    personTypes: ['CLIENT'],
    employeeData: null,
  );

  final Person mockBarber2 = Person(
    id: 4,
    name: 'Ana Barbeira',
    description: 'Barbeira jovem',
    email: 'ana.barbeira@example.com',
    phone: '11987654321',
    active: true,
    document: '888.999.000-11',
    personTypes: ['EMPLOYEE'],
    employeeData: null,
  );

  final List<SchedulingItem> mockItems = [
    SchedulingItem(
      scheduling: Scheduling(
        id: 1,
        clientId: mockClient.id,
        barberId: mockBarber.id,
        startDate: DateTime(2025, 6, 18, 10, 0),
        endDate: DateTime(2025, 6, 18, 11, 0),
      ),
      client: mockClient, 
      barber: mockBarber,
    ),
    SchedulingItem(
      scheduling: Scheduling(
        id: 2,
        clientId: mockClient2.id, 
        barberId: mockBarber2.id, 
        startDate: DateTime(2025, 6, 19, 14, 30),
        endDate: DateTime(2025, 6, 19, 15, 30),
      ),
      client: mockClient2,
      barber: mockBarber2,
    ),
  ];

  group('SchedulingList', () {
    testWidgets('should display "Nenhum agendamento encontrado" when items list is empty', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SchedulingList(
            items: const [],
            onRefresh: () async {},
          ),
        ),
      );


      expect(find.text('Nenhum agendamento encontrado'), findsOneWidget);
      expect(find.byType(Card), findsNothing);
    });

    testWidgets('should display list of scheduling items when items list is not empty', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SchedulingList(
            items: mockItems,
            onRefresh: () async {},
          ),
        ),
      );

      expect(find.byType(Card), findsNWidgets(mockItems.length));
      expect(find.text('João Cliente'), findsOneWidget);
      expect(find.text('Maria Cliente'), findsOneWidget);
    });

    testWidgets('should trigger onRefresh when RefreshIndicator is pulled', (WidgetTester tester) async {
      
      bool refreshCalled = false;
      Future<void> mockOnRefresh() async {
        refreshCalled = true;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: SchedulingList(
            items: const [], 
            onRefresh: mockOnRefresh,
          ),
        ),
      );
      await tester.fling(find.byType(ListView), const Offset(0.0, 300.0), 1000.0);
      await tester.pumpAndSettle();

      
      expect(refreshCalled, isTrue);
    });
  });
}