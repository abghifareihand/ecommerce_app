part of 'auth_bloc.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final AuthResponseModel authResponseModel;
  AuthSuccess({
    required this.authResponseModel,
  });
}

final class AuthUserSuccess extends AuthState {
  final UserResponseModel user;
  AuthUserSuccess({
    required this.user,
  });
}

final class AuthError extends AuthState {
  final String message;
  AuthError({
    required this.message,
  });
}
