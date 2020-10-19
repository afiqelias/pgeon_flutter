import 'package:dio/dio.dart';
import 'models/delivery_order.dart';
import 'package:pgeon_flutter/global.dart';

abstract class DeliveryOrderRepository {
  Future<List<DeliveryOrder>> getDeliveryOrderList(String hideComplete);
}

class DeliveryOrderRepositoryImp implements DeliveryOrderRepository {
  @override
  Future<List<DeliveryOrder>> getDeliveryOrderList(String hideComplete) async {
    try {
      Dio dio = new Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["apikey"] = "9569f8f5a10378115ef5089b7fec6577";
      String url = DELIVERY_ORDER_LIST_URL.replaceAll("{hide_complete}", hideComplete).replaceAll("{version}", "1");
      print(url);
      Response response = await dio.get(url);
      List<DeliveryOrder> deliveryOrder = deliveryOrderFromJson(response.data['data']['AM']);
      return deliveryOrder;
    } on DioError catch (e) {
      print(e);
      print(e.message.toString());
      throw (NetworkException());
    }
  }
}

class NetworkException implements Exception {}
