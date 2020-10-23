import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pgeon_flutter/helpers/pref_helper.dart';
import '../models/user.dart';
import 'package:pgeon_flutter/global.dart';

abstract class UserRepository {
  Future<User> auth(String username, String password);
  Future<User> getAuthUser();
}

class UserRepositoryImp implements UserRepository {
  @override
  Future<User> auth(String username, String password) async {
    try {
      Response response = await Dio()
          .post(LOGIN_URL, data: {'username': username, 'password': password});
      print(response.data['data']);
      User user = User.fromJson(response.data['data']);
      return user;
    } catch (e) {
      if (e is DioError) {
        throw (e.response.data['error']['message']);
      } else {
        throw ("error");
      }
    }
  }

  @override
  Future<User> getAuthUser() async {
    var fromCache = await PrefHelper.getCache("authUser");
    if (fromCache != null) {
      Map json = jsonDecode(fromCache);
      return User.fromJson(json);
    }
    return null;
  }

  
}
