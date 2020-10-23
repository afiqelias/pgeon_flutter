import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgeon_flutter/blocs/delivery_order/delivery_order_bloc.dart';
import 'package:pgeon_flutter/data/models/delivery_order.dart';

class DeliveryOrderScreen extends StatefulWidget {
  @override
  _DeliveryOrderScreenState createState() => _DeliveryOrderScreenState();
}

class _DeliveryOrderScreenState extends State<DeliveryOrderScreen> {
  DeliveryOrderBloc deliveryOrderBloc;
  @override
  Widget build(BuildContext context) {
    deliveryOrderBloc = context.bloc<DeliveryOrderBloc>();
    deliveryOrderBloc.add(GetDeliveryOrderList("false"));
    return Container(
        child: BlocConsumer<DeliveryOrderBloc, DeliveryOrderState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DeliveryOrderLoaded) {
          return buildList(state.deliveryOrderList);
        } else {
          return buildLoading();
        }
      },
    ));
  }

  Widget buildList(List<DeliveryOrder> deliveryOrderList) {
    return ListView.builder(
      itemCount: deliveryOrderList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: Container(
              padding: EdgeInsets.all(20),
              child: ListTile(
                leading: RichText(
                  text: TextSpan(
                      text:
                          '${deliveryOrderList[index].addr1 ?? ''} ${deliveryOrderList[index].addr2 ?? ''} ${deliveryOrderList[index].addr3 ?? ''} ${deliveryOrderList[index].addr1 ?? ''}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: '\nTest',
                          style: TextStyle(
                              fontSize: 12, color: Colors.black54, height: 1.5),
                        ),
                        TextSpan(
                          text: '\nTest',
                          style: TextStyle(
                              fontSize: 12, color: Colors.black54, height: 1.5),
                        ),
                      ]),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    deliveryOrderBloc.close();
    super.dispose();
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
