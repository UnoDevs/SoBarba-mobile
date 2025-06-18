import 'package:flutter_test/flutter_test.dart';

// Simulação da entidade Scheduling
class Scheduling {
  final int id;
  final int clientId;
  final int barberId;
  final DateTime startDate;
  final DateTime endDate;

  Scheduling({
    required this.id,
    required this.clientId,
    required this.barberId,
    required this.startDate,
    required this.endDate,
  });

  factory Scheduling.fromMap(Map<String, dynamic> map) {
    return Scheduling(
      id: map['id'],
      clientId: map['clientId'],
      barberId: map['barberId'],
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'clientId': clientId,
      'barberId': barberId,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }
}

// Fake do datasource
class FakeSchedulingDatasource {
  final List<Map<String, dynamic>> _data = [
    {
      'id': 1,
      'clientId': 101,
      'barberId': 201,
      'startDate': DateTime.now().toIso8601String(),
      'endDate': DateTime.now().add(Duration(hours: 1)).toIso8601String(),
    },
  ];

  Future<List<Map<String, dynamic>>> findAll() async {
    return _data;
  }

  Future<Map<String, dynamic>?> create(Scheduling scheduling) async {
    return scheduling.toMap();
  }

  Future<void> delete(int id) async {
    // Fake delete
  }
}

// Repository usando o fake
class SchedulingRepository {
  final FakeSchedulingDatasource _schedulingDatasource;

  SchedulingRepository(this._schedulingDatasource);

  Future<List<Scheduling>> findAll() async {
    final response = await _schedulingDatasource.findAll();
    final List<Scheduling> schedulings = [];

    for (var entity in response) {
      schedulings.add(Scheduling.fromMap(entity));
    }

    return schedulings;
  }

  Future<Scheduling?> create(Scheduling entity) async {
    final response = await _schedulingDatasource.create(entity);
    if (response == null) return null;
    return Scheduling.fromMap(response);
  }

  Future<void> delete(int id) async {
    await _schedulingDatasource.delete(id);
  }
}

void main() {
  group('SchedulingRepository', () {
    late SchedulingRepository repository;

    setUp(() {
      repository = SchedulingRepository(FakeSchedulingDatasource());
    });

    test('deve retornar uma lista de agendamentos', () async {
      final result = await repository.findAll();

      expect(result.length, greaterThan(0));
      expect(result.first.clientId, equals(101));
    });

    test('deve criar um novo agendamento', () async {
      final newScheduling = Scheduling(
        id: 2,
        clientId: 102,
        barberId: 202,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(hours: 1)),
      );

      final result = await repository.create(newScheduling);

      expect(result, isNotNull);
      expect(result!.barberId, equals(202));
    });

    test('deve executar o delete sem erro', () async {
      await repository.delete(1);
    });
  });
}