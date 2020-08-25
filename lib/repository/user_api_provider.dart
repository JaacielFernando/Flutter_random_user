import 'package:flutter_random_user_login/model/user_response.dart';
import 'package:dio/dio.dart';

class UserApiProvider{
  final String _endpoint = "https://randomuser.me/api/";
  final Dio _dio = Dio();

  Future<UserResponse> getUuser() async {
    try {
      Response response = await _dio.get(_endpoint);
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserResponse.withError("$error");
    }
  }
}