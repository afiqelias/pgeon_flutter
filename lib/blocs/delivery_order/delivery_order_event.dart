part of 'delivery_order_bloc.dart';

@immutable
abstract class DeliveryOrderEvent {}

class GetDeliveryOrderList extends DeliveryOrderEvent {
  final String hideComplete;
  GetDeliveryOrderList(this.hideComplete);
}

