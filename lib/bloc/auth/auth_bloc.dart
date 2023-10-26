import 'package:ecommerce_app/data/datasources/remote/auth_remote_datasource.dart';
import 'package:ecommerce_app/data/models/request/login_request_model.dart';
import 'package:ecommerce_app/data/models/request/register_request_model.dart';
import 'package:ecommerce_app/data/models/response/auth_response_model.dart';
import 'package:ecommerce_app/data/models/response/user_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthRegisterEvent>((event, emit) async {
      emit(AuthLoading());
      final result =
          await AuthRemoteDatasource().register(event.registerRequestModel);
      result.fold(
        (error) => emit(AuthError(message: error)),
        (success) => emit(AuthSuccess(authResponseModel: success)),
      );
    });
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoading());
      final result =
          await AuthRemoteDatasource().login(event.loginRequestModel);
      result.fold(
        (error) => emit(AuthError(message: error)),
        (success) => emit(AuthSuccess(authResponseModel: success)),
      );
    });
    on<AuthGetUserEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await AuthRemoteDatasource().getUser();
      result.fold(
        (error) => emit(AuthError(message: error)),
        (success) => emit(AuthUserSuccess(user: success)),
      );
    });
  }
}
