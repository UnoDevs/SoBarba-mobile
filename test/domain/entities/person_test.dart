import 'package:flutter_test/flutter_test.dart';
import 'package:sobarba_mobile/domain/entities/person.dart';

void main() {
  group('Person', () {
    final personMap = {
      'id': 1,
      'name': 'João Silva',
      'description': 'Cliente fiel',
      'email': 'joao@email.com',
      'phone': '11999999999',
      'active': true,
      'document': '123.456.789-00',
      'personTypes': ['CLIENT'],
      'employeeData': {
        'id': 10,
        'hireDate': '2024-01-01T00:00:00.000',
        'terminationDate': '2025-01-01T00:00:00.000',
        'salary': 3000.0,
        'commission': 500.0,
        'jobTitle': 'Barbeiro'
      },
    };

    test('fromMap deve criar corretamente o objeto Person', () {
      final person = Person.fromMap(personMap);

      expect(person.id, 1);
      expect(person.name, 'João Silva');
      expect(person.description, 'Cliente fiel');
      expect(person.email, 'joao@email.com');
      expect(person.phone, '11999999999');
      expect(person.active, isTrue);
      expect(person.document, '123.456.789-00');
      expect(person.personTypes, contains('CLIENT'));

      
      expect(person.employeeData, isNotNull);
      expect(person.employeeData!.id, 10);
      expect(person.employeeData!.hireDate, DateTime.parse('2024-01-01T00:00:00.000'));
      expect(person.employeeData!.terminationDate, DateTime.parse('2025-01-01T00:00:00.000'));
      expect(person.employeeData!.salary, 3000.0);
      expect(person.employeeData!.commission, 500.0);
      expect(person.employeeData!.jobTitle, 'Barbeiro');
    });

    test('toMap deve converter corretamente o objeto para Map', () {
      final person = Person.fromMap(personMap);
      final map = person.toMap();

      expect(map['id'], 1);
      expect(map['name'], 'João Silva');
      expect(map['email'], 'joao@email.com');
      expect(map['employeeData']['jobTitle'], 'Barbeiro');
    });
  });
}