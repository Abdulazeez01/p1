import 'package:bloc/bloc.dart';
import 'package:front_end/bloc/authentication/authentication_event.dart';
import 'package:front_end/bloc/authentication/authentication_state.dart';
import 'package:front_end/models/user_model.dart';
import 'package:front_end/repository/user_repository.dart';

// BLoC
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({required this.userRepository})
      : super(AuthenticationUninitialized()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
  }

  Future<void> _onAppStarted(
      AppStarted event, Emitter<AuthenticationState> emit) async {
    final bool hasToken = await userRepository.hasToken();

    if (hasToken) {
      final User user = await userRepository.getUser();
      emit(AuthenticationAuthenticated(user: user));
    } else {
      emit(AuthenticationUnauthenticated());
    }
  }

  Future<void> _onLoggedIn(
      LoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      final User user = await userRepository.authenticate(
        username: event.username,
        password: event.password,
      );

      emit(AuthenticationAuthenticated(user: user));
    } catch (e) {
      emit(AuthenticationUnauthenticated());
    }
  }

  Future<void> _onLoggedOut(
      LoggedOut event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await userRepository.deleteToken();
    emit(AuthenticationUnauthenticated());
  }
}
