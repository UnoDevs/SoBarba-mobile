import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:sobarba_mobile/ui/login/view_models/auth_viewmodel.dart';

class DioClient {

  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;
  late Dio dio;

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://sobarba-back-end-production.up.railway.app',
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 15),
      )
    );

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final auth = Get.find<AuthViewmodel>();
        final token = auth.token;
        if(token != null){
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ));
  }
}