part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class Authenticate extends AuthEvent {
  final String username;
  final String password;
  Authenticate(this.username,this.password);
}

