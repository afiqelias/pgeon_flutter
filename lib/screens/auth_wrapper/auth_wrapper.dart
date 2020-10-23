import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgeon_flutter/screens/auth/auth.dart';
import 'package:pgeon_flutter/screens/auth/bloc/auth_bloc.dart';
import 'package:pgeon_flutter/screens/menu/menu.dart';

class AuthWrapper extends StatefulWidget {
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {

  AuthBloc authBloc;
  
  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.add(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        print('WRAPPER STATE $state');
        if (state is AuthSuccess) {
          print('masuk auth');
          return Menu();
        } else if (state is NotAuthenticated) {
          print('masuk unauth');
          return Auth();
        } else {
          return Menu();
        }
      },
    );
  }

  @override
  void dispose() {
    authBloc.close();
    super.dispose();
  }
}
