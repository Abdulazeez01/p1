// Events
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String username;
  final String password;

  const LoggedIn({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}

class LoggedOut extends AuthenticationEvent {}
