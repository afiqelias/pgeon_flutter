import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgeon_flutter/screens/auth/bloc/auth_bloc.dart';
import 'package:pgeon_flutter/screens/sidebar/sidebar.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(child:   FlatButton(
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.red[400]),
              ),
              onPressed: () {
                final authBloc = context.bloc<AuthBloc>();
                authBloc.add(Logout());
              },
            ),),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Sidebar()
      ),
    );
  }
}
