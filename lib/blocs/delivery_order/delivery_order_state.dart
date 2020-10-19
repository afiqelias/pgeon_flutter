part of 'delivery_order_bloc.dart';

@immutable
abstract class DeliveryOrderState {
  const DeliveryOrderState();
}

class DeliveryOrderInitial extends DeliveryOrderState {}

class DeliveryOrderLoading extends DeliveryOrderState {
  const DeliveryOrderLoading();
}

class DeliveryOrderLoaded extends DeliveryOrderState {
  final List<DeliveryOrder> deliveryOrderList;
  const DeliveryOrderLoaded(this.deliveryOrderList);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is DeliveryOrderLoaded &&
      o.deliveryOrderList == deliveryOrderList;
  }

  @override
  int get hashCode => deliveryOrderList.hashCode;
}

class DeliveryOrderError extends DeliveryOrderState {
  final String message;
  const DeliveryOrderError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is DeliveryOrderError &&
      o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
