import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgeon_flutter/components/clipper.dart';
import 'package:pgeon_flutter/screens/auth/bloc/auth_bloc.dart';
import 'package:pgeon_flutter/screens/menu/menu.dart';

class Auth extends StatefulWidget {
  final Function toggleView;
  Auth({this.toggleView});

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String username = 'puchong14';
  String password = '123456789';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                ClipPath(
                  clipper: Clipper(),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: <Color>[Colors.red[200], Colors.red[400]])),
                    child: Center(
                      child: Text(
                        'Auth',
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 5.0,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    print('state $state');
                    if (state is AuthSuccess) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Menu()));
                    } else if (state is AuthError) {
                      setState(() {
                        error = state.message;
                        loading = false;
                      });
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthInitial) {
                      return buildAuth();
                    } else if (state is AuthLoading) {
                      return buildLoading();
                    } else {
                      return buildAuth();
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }

  Widget buildAuth() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(143, 148, 251, .2),
                        blurRadius: 20.0,
                        offset: Offset(0, 10))
                  ]),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[100]))),
                    child: TextFormField(
                      initialValue: 'puchong14',
                      validator: (val) =>
                          val.isEmpty ? 'Authname is required' : null,
                      onChanged: (val) {
                        setState(() => username = val);
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Authname',
                          labelStyle: TextStyle(color: Colors.grey[400]),
                          hintText: "Authname",
                          hintStyle: TextStyle(color: Colors.grey[400])),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: '123456789',
                      obscureText: true,
                      validator: (val) =>
                          val.isEmpty ? 'Password is required' : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          labelText: 'Passwor',
                          labelStyle: TextStyle(color: Colors.grey[400]),
                          hintStyle: TextStyle(color: Colors.grey[400])),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            ),
            SizedBox(height: 30.0),
            ButtonTheme(
              height: 50.0,
              minWidth: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0)),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    authenticate(context, username, password);
                  }
                },
                color: Colors.red[400],
                child: Text(
                  'Log Masuk',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            FlatButton(
              child: Text(
                'Register',
                style: TextStyle(color: Colors.red[400]),
              ),
              onPressed: () {
                widget.toggleView();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void authenticate(BuildContext context, String username, password) {
    final authBloc = context.bloc<AuthBloc>();
    authBloc.add(Authenticate(username, password));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
