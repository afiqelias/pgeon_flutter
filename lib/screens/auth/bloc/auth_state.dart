part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class NotAuthenticated extends AuthState {
  const NotAuthenticated();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  final User user;
  const AuthSuccess(this.user);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is AuthSuccess &&
      o.user == user;
  }

  @override
  int get hashCode => user.hashCode;
}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is AuthError &&
      o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
