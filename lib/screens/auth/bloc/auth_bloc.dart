import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pgeon_flutter/data/models/user.dart';
import 'package:pgeon_flutter/data/repositories/user_repository.dart';
import 'package:pgeon_flutter/helpers/pref_helper.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _userRepository;
  AuthBloc(this._userRepository) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStarted) {
      User user = await _userRepository.getAuthUser();
      if (user != null) {
        yield (AuthSuccess(user));
      } else {
        yield (NotAuthenticated());
      }
    }

    if (event is Authenticate) {
      try {
        yield (AuthLoading()); // set event to authloading
        final User user =
            await _userRepository.auth(event.username, event.password);
        if (await PrefHelper.storeCache("authUser", jsonEncode(user.toJson()))) {
          yield (AuthSuccess(user));
        } else {
          yield (AuthError("Error storing cache"));
        }
      } catch (e) {
        yield (AuthError(e));
      }
    }

    if (event is Logout) {
      await PrefHelper.clearCache("authUser");
      yield (NotAuthenticated());
    }
  }


  // @override
  // AuthState fromJson(Map<String, dynamic> json) {
  //   try {
  //     final user = User.fromJson(json);
  //     return AuthSuccess(user);
  //   } catch (_) {
  //     print(_);
  //     return null;
  //   }
  // }

  // @override
  // Map<String, dynamic> toJson(AuthState state) {
  //   if (state is AuthSuccess) {
  //     return state.user.toJson();
  //   } else {
  //     return null;
  //   }
  // }
}
