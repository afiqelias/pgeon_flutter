import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pgeon_flutter/data/models/user.dart';
import 'package:pgeon_flutter/data/user_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  final UserRepository _userRepository;
  AuthBloc(this._userRepository) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is Authenticate) {
      try {
        yield (AuthLoading());
        final User user =
            await _userRepository.auth(event.username, event.password);
        yield (AuthSuccess(user));
      } on NetworkException {
        yield (AuthError("Invalid username or password"));
      }
    }
  }

  @override
  AuthState fromJson(Map<String, dynamic> json) {
    try {
      final user = User.fromJson(json);
      return AuthSuccess(user);
    } catch (_) {
      print(_);
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(AuthState state) {
    if (state is AuthSuccess) {
      return state.user.toJson();
    } else {
      return null;
    }
  }
}
