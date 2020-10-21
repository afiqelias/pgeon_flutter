import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgeon_flutter/screens/auth/auth.dart';
import 'package:pgeon_flutter/screens/auth/bloc/auth_bloc.dart';
import 'package:pgeon_flutter/screens/menu/menu.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('auth wrapper');
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        print('WRAPPER STATE $state');
        if (state is AuthSuccess) {
          print('masuk auth');
          return Menu();
        } else {
          print('masuk unauth');
          return Auth();
        }
      },
    );
  }
}
