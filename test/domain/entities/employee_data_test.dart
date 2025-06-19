import 'package:flutter_test/flutter_test.dart';
import 'package:sobarba_mobile/domain/entities/employee_data.dart';

void main() {
  group('EmployeeData', () {
    final now = DateTime.now();
    final termination = now.add(const Duration(days: 30));

    final employeeMap = {
      'id': 1,
      'hireDate': now.toIso8601String(),
      'terminationDate': termination.toIso8601String(),
      'salary': 3000.0,
      'commission': 500.0,
      'jobTitle': 'Barbeiro',
    };

    test('fromMap deve criar corretamente o objeto', () {
      final employee = EmployeeData.fromMap(employeeMap);

      expect(employee.id, equals(1));
      expect(employee.hireDate, equals(DateTime.parse(employeeMap['hireDate'] as String)));
      expect(employee.terminationDate, equals(DateTime.parse(employeeMap['terminationDate'] as String)));
      expect(employee.salary, equals(3000.0));
      expect(employee.commission, equals(500.0));
      expect(employee.jobTitle, equals('Barbeiro'));
    });

    test('toMap deve retornar um mapa válido', () {
      final employee = EmployeeData.fromMap(employeeMap);
      final map = employee.toMap();

      expect(map['id'], equals(1));
      expect(map['salary'], equals(3000.0));
      expect(map['commission'], equals(500.0));
      expect(map['jobTitle'], equals('Barbeiro'));
    });

    test('toJson e fromJson devem funcionar corretamente', () {
      final employee = EmployeeData.fromMap(employeeMap);
      final json = employee.toJson();
      final newEmployee = EmployeeData.fromJson(json);

      expect(newEmployee.id, equals(employee.id));
      expect(newEmployee.salary, equals(employee.salary));
      expect(newEmployee.jobTitle, equals(employee.jobTitle));
    });

    test('fromMap deve lidar com terminationDate nulo', () {
      final mapWithoutTermination = Map<String, dynamic>.from(employeeMap);
      mapWithoutTermination['terminationDate'] = null;

      final employee = EmployeeData.fromMap(mapWithoutTermination);
      expect(employee.terminationDate, isNull);
    });
  });
}