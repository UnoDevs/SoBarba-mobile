import 'package:flutter_test/flutter_test.dart';
import 'package:sobarba_mobile/domain/entities/scheduling_item.dart';

void main() {
  group('SchedulingItem', () {
    final now = DateTime.now();
    
    final personMap = {
      'id': 1,
      'name': 'João',
      'description': 'Cliente',
      'email': 'joao@email.com',
      'phone': '11999999999',
      'active': true,
      'document': '12345678900',
      'personTypes': ['CLIENT'],
      'employeeData': null,
    };

    final schedulingMap = {
      'id': 1,
      'clientId': 1,
      'barberId': 2,
      'startDate': now.toIso8601String(),
      'endDate': now.add(const Duration(hours: 1)).toIso8601String(),
    };

    final schedulingItemMap = {
      'scheduling': schedulingMap,
      'client': personMap,
      'barber': personMap,
    };

    test('fromMap deve criar corretamente o objeto', () {
      final item = SchedulingItem.fromMap(schedulingItemMap);

      expect(item.scheduling.id, equals(1));
      expect(item.client.name, equals('João'));
      expect(item.barber.email, equals('joao@email.com'));
    });

    test('toMap deve converter corretamente o objeto', () {
      final item = SchedulingItem.fromMap(schedulingItemMap);
      final map = item.toMap();

      expect(map['scheduling']['id'], equals(1));
      expect(map['client']['name'], equals('João'));
      expect(map['barber']['document'], equals('12345678900'));
    });

    test('fromJson e toJson devem funcionar corretamente', () {
      final item = SchedulingItem.fromMap(schedulingItemMap);
      final json = item.toJson();
      final parsed = SchedulingItem.fromJson(json);

      expect(parsed.scheduling.clientId, equals(1));
      expect(parsed.client.phone, equals('11999999999'));
      expect(parsed.barber.active, isTrue);
    });
  });
}