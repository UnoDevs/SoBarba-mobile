import 'package:sobarba_mobile/core/network/dio_client.dart';

class AuthDatasource {
  final _dio = DioClient().dio;

  getToken(String email, String password) async {
    final response = await _dio.post('auth/singin', data: {
      'email': email,
      'password': password
    });
    return response.data;
  }
}