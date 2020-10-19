import 'package:dio/dio.dart';
import 'models/user.dart';
import 'package:pgeon_flutter/global.dart';

abstract class UserRepository {
  Future<User> auth(String username, String password);
}

class UserRepositoryImp implements UserRepository {
  @override
  Future<User> auth(String username, String password) async {
    try {
      print('url $LOGIN_URL');
      Response response = await Dio()
          .post(LOGIN_URL, data: {'username': username, 'password': password});
      print(response.data['data']);
      User user = User.fromJson(response.data['data']);
      return user;
    } on DioError catch(e) {
      print(e);
      throw (NetworkException());
    }
  }
}

class NetworkException implements Exception {}

