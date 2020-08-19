import 'package:flutter_random_user_login/model/user_response.dart';
import 'package:flutter_random_user_login/repository/user_api_provider.dart';

class UserRepository{
  UserApiProvider _apiProvider = UserApiProvider();

  Future<UserResponse> getUser(){
    return _apiProvider.getUser();
  }
}