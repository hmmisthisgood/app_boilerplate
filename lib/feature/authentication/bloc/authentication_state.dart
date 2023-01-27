import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class FirstTimeAppOpen extends AuthState {}

class AuthUninitialized extends AuthState {}

class AuthAuthenticated extends AuthState {
  final bool showLoginToast;

  AuthAuthenticated({required this.showLoginToast});

  @override
  List<Object> get props => [showLoginToast];
}

class AuthUnauthenticated extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
