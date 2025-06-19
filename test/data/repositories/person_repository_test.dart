import 'package:flutter_test/flutter_test.dart';

class Person {
  final int id;
  final String name;

  Person({required this.id, required this.name});

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['id'],
      name: map['name'],
    );
  }
}

class FakePersonDatasource {
  Future<List<Map<String, dynamic>>> findAll() async {
    return [
      {'id': 1, 'name': 'João'},
      {'id': 2, 'name': 'Maria'},
    ];
  }
}

class PersonRepository {
  final FakePersonDatasource _personDatasource;

  PersonRepository(this._personDatasource);

  Future<List<Person>> findAll() async {
    final response = await _personDatasource.findAll();
    final List<Person> people = [];

    response.forEach((entity) {
      people.add(Person.fromMap(entity));
    });

    return people;
  }
}

void main() {
  group('PersonRepository', () {
    late PersonRepository repository;

    setUp(() {
      repository = PersonRepository(FakePersonDatasource());
    });

    test('deve retornar lista de pessoas corretamente', () async {
      final result = await repository.findAll();

      expect(result.length, 2);
      expect(result[0].name, equals('João'));
      expect(result[1].name, equals('Maria'));
    });
  });
}