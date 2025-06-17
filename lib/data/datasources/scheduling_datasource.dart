import 'package:sobarba_mobile/core/network/dio_client.dart';
import 'package:sobarba_mobile/domain/entities/scheduling.dart';

class SchedulingDatasource {
  final _dio = DioClient().dio;

  findAll() async {
    final response = await _dio.get('/scheduling');
    return response.data;
  }

  create(Scheduling entity) async{
    final response = await _dio.post("/scheduling", data: {
    "startDate": entity.startDate.toIso8601String(),
    "endDate": entity.endDate.toIso8601String(),
    "clientId": entity.clientId,
    "barberId": entity.barberId
    });
    return response.data;
  }

  delete(int id) async{
    await _dio.delete("/scheduling/$id");
  }
}