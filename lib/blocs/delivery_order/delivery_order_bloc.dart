import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pgeon_flutter/data/repositories/delivery_order_repository.dart';
import 'package:pgeon_flutter/data/models/delivery_order.dart';

part 'delivery_order_event.dart';
part 'delivery_order_state.dart';

class DeliveryOrderBloc extends Bloc<DeliveryOrderEvent, DeliveryOrderState> {
  final DeliveryOrderRepository _deliveryOrderRepository;
  DeliveryOrderBloc(this._deliveryOrderRepository) : super(DeliveryOrderInitial());

  @override
  Stream<DeliveryOrderState> mapEventToState(
    DeliveryOrderEvent event,
  ) async* {
    if (event is GetDeliveryOrderList) {
      try {
        // yield (DeliveryOrderLoading());
        final List<DeliveryOrder> deliveryOrderList =
            await _deliveryOrderRepository.getDeliveryOrderList(event.hideComplete);
        yield (DeliveryOrderLoaded(deliveryOrderList));
      } on NetworkException {
        yield (DeliveryOrderError("Error fetching delivery order"));
      }
    }
  }
}
