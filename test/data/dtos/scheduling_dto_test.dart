import 'package:flutter_faculdade_v1/data/dtos/scheduling_dto.dart';
import 'package:flutter_faculdade_v1/domain/entities/scheduling.dart';
import 'package:test/test.dart';

void main(){

  SchedulingDto scheduling = SchedulingDto(id: 1,client: 'Felipe', barber: 'Jonas', service: 'Barba', totalValue: 50, date: DateTime.now());

  test('convert Scheduling DTO to entity', (){
    Scheduling entity = scheduling.toEntity();
    expect(entity, isA<Scheduling>());
    expect(entity.client,isNotNull);
    expect(entity.client,equals('Felipe'));
  });
}