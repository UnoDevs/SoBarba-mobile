import 'package:sobarba_mobile/core/network/dio_client.dart';

class PersonDatasource {
  final _dio = DioClient().dio;

  findAll() async {
    final response = await _dio.get('person');
    return response.data;
  }
}