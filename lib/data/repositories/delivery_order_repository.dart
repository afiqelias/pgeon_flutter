import 'package:dio/dio.dart';
import 'package:pgeon_flutter/data/models/user.dart';
import 'package:pgeon_flutter/data/repositories/user_repository.dart';
import '../models/delivery_order.dart';
import 'package:pgeon_flutter/global.dart';

abstract class DeliveryOrderRepository {
  Future<List<DeliveryOrder>> getDeliveryOrderList(String hideComplete);
}

class DeliveryOrderRepositoryImp implements DeliveryOrderRepository {
  Dio _dio = new Dio();

  @override
  Future<List<DeliveryOrder>> getDeliveryOrderList(String hideComplete) async {
    try {
      User user = await UserRepositoryImp().getAuthUser();
      print('session user: ${user.username}');
      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers["apikey"] = user.sessionToken;
      print('session token: ${user.sessionToken}');
      String url = DELIVERY_ORDER_LIST_URL
          .replaceAll("{hide_complete}", hideComplete)
          .replaceAll("{version}", "1");
      Response response = await _dio.get(url);
      List<DeliveryOrder> deliveryOrder =
          deliveryOrderFromJson(response.data['data']['AM']);
      return deliveryOrder;
    } on DioError catch (e) {
      print(e);
      print(e.message.toString());
      throw (NetworkException());
    }
  }
}

class NetworkException implements Exception {}
