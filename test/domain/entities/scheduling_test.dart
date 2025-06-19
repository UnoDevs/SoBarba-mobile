import 'package:flutter_test/flutter_test.dart';
import 'package:sobarba_mobile/domain/entities/scheduling.dart';

void main() {
  group('Scheduling', () {
    final now = DateTime.now();
    final schedulingMap = {
      'id': 1,
      'clientId': 2,
      'barberId': 3,
      'startDate': now.toIso8601String(),
      'endDate': now.add(const Duration(hours: 1)).toIso8601String(),
    };

    test('fromMap deve criar corretamente o objeto', () {
      final scheduling = Scheduling.fromMap(schedulingMap);

      expect(scheduling.id, equals(1));
      expect(scheduling.clientId, equals(2));
      expect(scheduling.barberId, equals(3));
      expect(scheduling.startDate, DateTime.parse(schedulingMap['startDate']! as String));
      expect(scheduling.endDate, DateTime.parse(schedulingMap['endDate']! as String));
    });

    test('toMap deve converter corretamente o objeto', () {
      final scheduling = Scheduling.fromMap(schedulingMap);
      final map = scheduling.toMap();

      expect(map['id'], equals(1));
      expect(map['clientId'], equals(2));
      expect(map['barberId'], equals(3));
      expect(map['startDate'], equals(scheduling.startDate.toIso8601String()));
      expect(map['endDate'], equals(scheduling.endDate.toIso8601String()));
    });

    test('fromJson e toJson devem funcionar corretamente', () {
      final scheduling = Scheduling.fromMap(schedulingMap);
      final jsonString = scheduling.toJson();
      final newScheduling = Scheduling.fromJson(jsonString);

      expect(newScheduling.id, equals(scheduling.id));
      expect(newScheduling.clientId, equals(scheduling.clientId));
      expect(newScheduling.barberId, equals(scheduling.barberId));
      expect(newScheduling.startDate, equals(scheduling.startDate));
      expect(newScheduling.endDate, equals(scheduling.endDate));
    });
  });
}