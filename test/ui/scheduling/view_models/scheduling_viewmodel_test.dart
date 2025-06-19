
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:sobarba_mobile/data/repositories/person_repository.dart';
import 'package:sobarba_mobile/data/repositories/scheduling_repository.dart';
import 'package:sobarba_mobile/domain/entities/person.dart';
import 'package:sobarba_mobile/domain/entities/scheduling.dart';
import 'package:sobarba_mobile/domain/entities/scheduling_item.dart';
import 'package:sobarba_mobile/ui/scheduling/view_models/scheduling_viewmodel.dart';

@GenerateMocks([SchedulingRepository, PersonRepository])
import 'scheduling_viewmodel_test.mocks.dart';

void main() {
  late MockSchedulingRepository mockSchedulingRepository;
  late MockPersonRepository mockPersonRepository;
  late SchedulingViewModel viewModel;

  setUp(() {
    mockSchedulingRepository = MockSchedulingRepository();
    mockPersonRepository = MockPersonRepository();
    viewModel = SchedulingViewModel(
      schedulingRepository: mockSchedulingRepository,
      personRepository: mockPersonRepository,
    );

    // Get.testMode = true; é geralmente usado para simular o ambiente Flutter
    // sem precisar de um MaterialApp, mas para Get.snackbar você precisa de um.
    // Para testar snackbars, é melhor envolver o teste em um GetMaterialApp
    // e então verificar o texto que aparece na tela.
  });

  tearDown(() {
    Get.reset();
  });

  final mockClient = Person(
    id: 1,
    name: 'João Cliente',
    description: 'Desc',
    email: 'a@a.com',
    phone: '123',
    active: true,
    document: '123',
    personTypes: ['CLIENT'],
  );
  final mockBarber = Person(
    id: 2,
    name: 'Pedro Barbeiro',
    description: 'Desc',
    email: 'b@b.com',
    phone: '456',
    active: true,
    document: '456',
    personTypes: ['EMPLOYEE'],
  );
  final mockScheduling = Scheduling(
    id: 1,
    clientId: mockClient.id!,
    barberId: mockBarber.id!,
    startDate: DateTime(2025, 6, 18, 10, 0),
    endDate: DateTime(2025, 6, 18, 11, 0),
  );

  group('SchedulingViewModel', () {
    testWidgets('findAllPeople deve popular a lista _people e gerenciar _isLoading', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(home: Container())); // Necessário para Get.snackbar
      when(mockPersonRepository.findAll()).thenAnswer((_) async => [mockClient, mockBarber]);

      expect(viewModel.isLoading.value, isFalse);
      expect(viewModel.people.isEmpty, isTrue);

      await viewModel.findAllPeople();

      expect(viewModel.isLoading.value, isFalse);
      expect(viewModel.people.length, 2);
      expect(viewModel.people.first.name, 'João Cliente');
    });

    test('generateSchedulingItems deve montar corretamente os itens de agendamento', () {
      viewModel.people.assignAll([mockClient, mockBarber]);
      viewModel.schedulings.assignAll([mockScheduling]);

      expect(viewModel.schedulingItems.isEmpty, isTrue);

      viewModel.generateSchedulingItems();

      expect(viewModel.schedulingItems.length, 1);
      expect(viewModel.schedulingItems.first.client.name, 'João Cliente');
      expect(viewModel.schedulingItems.first.barber.name, 'Pedro Barbeiro');
    });

    test('generateSchedulingItems deve lidar com pessoas não encontradas', () {
      viewModel.people.assignAll([mockClient]);
      viewModel.schedulings.assignAll([mockScheduling]);

      expect(viewModel.schedulingItems.isEmpty, isTrue);

      viewModel.generateSchedulingItems();

      expect(viewModel.schedulingItems.isEmpty, isTrue);
    });
  });
}