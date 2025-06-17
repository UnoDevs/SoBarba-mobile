import 'package:sobarba_mobile/data/datasources/scheduling_datasource.dart';
import 'package:sobarba_mobile/domain/entities/scheduling.dart';

class SchedulingRepository {
  final SchedulingDatasource _schedulingDatasource = new SchedulingDatasource();

  Future<List<Scheduling>> findAll() async {
    final response = await _schedulingDatasource.findAll();
    final List<Scheduling> schedulings = [];

    if(response == null){
      return [];
    }

    response.forEach((entity) {
      schedulings.add(Scheduling.fromMap(entity));
    });

    return schedulings;
  }

  Future<Scheduling?> create(Scheduling entity) async {
    final response = await _schedulingDatasource.create(entity);

    if (response == null) {
      return null;
    }

    return Scheduling.fromMap(response);
  }

  Future<void> delete(int id) async {
    await _schedulingDatasource.delete(id);
  }
}