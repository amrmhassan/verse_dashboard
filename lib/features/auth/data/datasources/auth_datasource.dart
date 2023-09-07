import 'package:dio/dio.dart';
import 'package:verse_dashboard/constants/runtime_variables.dart';

class AuthDatasource {
  Future<void> auth(
    String username,
    String password,
  ) async {
    try {
      var response = await dio.post(
        '/login',
        data: {
          'email': username,
          'password': password,
        },
      );
      var body = response.data;
      print(body);
    } on DioException catch (e) {
      print(e);
    }
  }
}
