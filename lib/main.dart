import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pgeon_flutter/blocs/delivery_order/delivery_order_bloc.dart';
import 'package:pgeon_flutter/data/repositories/delivery_order_repository.dart';
import 'package:pgeon_flutter/data/repositories/user_repository.dart';
import 'package:pgeon_flutter/screens/auth_wrapper/auth_wrapper.dart';
import 'package:pgeon_flutter/screens/auth/auth.dart';
import 'package:pgeon_flutter/screens/auth/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(UserRepositoryImp()),
        ),
        BlocProvider(
          create: (context) => DeliveryOrderBloc(DeliveryOrderRepositoryImp()),
        ),
      ],
      child: MaterialApp(
        title: 'Pgeon Ops',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthWrapper(),
      ),
    );
  }
}
