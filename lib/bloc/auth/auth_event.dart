part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthRegisterEvent extends AuthEvent {
  final RegisterRequestModel registerRequestModel;
  AuthRegisterEvent({
    required this.registerRequestModel,
  });
}

class AuthLoginEvent extends AuthEvent {
  final LoginRequestModel loginRequestModel;

  AuthLoginEvent({
    required this.loginRequestModel,
  });
}

class AuthGetUserEvent extends AuthEvent {}
