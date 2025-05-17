import 'package:flutter_faculdade_v1/data/dtos/scheduling_dto.dart';
import 'package:flutter_faculdade_v1/data/services/scheduling_service.dart';
import 'package:flutter_faculdade_v1/domain/entities/scheduling.dart';
import 'package:test/test.dart';

void main() {
  SchedulingService schedulingService = SchedulingService();

  test('validar response 200 do fetchAllSchedulings', () async {
    expect(
      await schedulingService.fetchAllSchedulings(),
      isA<List<SchedulingDto>>(),
    );
  });

  test('validar response 200 do fetchCreateScheduling', () async {
    expect(
      await schedulingService.fetchCreateScheduling(
        Scheduling(
          client: 'Teste1',
          barber: 'Teste2',
          service: 'Service1',
          totalValue: 50,
          date: DateTime.now(),
        ),
      ),
      isA<SchedulingDto>(),
    );
  });

  test(
    'validar response 200 do fetchDeleteUser e campos do fetchCreateScheduling',
    () async {
      SchedulingDto? schedulingDto = await schedulingService.fetchCreateScheduling(
        Scheduling(
          client: 'Teste1',
          barber: 'Teste2',
          service: 'Service1',
          totalValue: 50,
          date: DateTime.now(),
        ),
      );
      expect(schedulingDto!.id, isNotNull );
      expect(await schedulingService.fetchDeleteUser(schedulingDto.id), isTrue);
    },
  );
}
