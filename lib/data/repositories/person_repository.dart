import 'package:sobarba_mobile/data/datasources/person_datasource.dart';
import 'package:sobarba_mobile/domain/entities/person.dart';

class PersonRepository {
  final PersonDatasource _personDatasource = new PersonDatasource();

  Future<List<Person>> findAll() async {
    final response = await _personDatasource.findAll();
    final List<Person> people = [];

    if(response == null){
      return [];
    }

    response.forEach((entity) {
      people.add(Person.fromMap(entity));
    });

    return people;
  }
}