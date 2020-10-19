import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgeon_flutter/screens/auth/auth.dart';
import 'package:pgeon_flutter/screens/auth/bloc/auth_bloc.dart';
import 'package:pgeon_flutter/screens/menu/menu.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = context.bloc<AuthBloc>();
    print('auth wrapper');
    return BlocListener(
      listener: (context, state) {
        if (state is AuthSuccess) {
          return Auth();
        } else {
          return Menu();
        }
      },
    );
  }
}
