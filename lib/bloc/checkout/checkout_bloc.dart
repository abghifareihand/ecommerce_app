

import 'package:ecommerce_app/data/datasources/remote/checkout_remote_datasource.dart';
import 'package:ecommerce_app/data/models/request/checkout_request_model.dart';
import 'package:ecommerce_app/data/models/response/checkout_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutInitial()) {
    on<PayCheckoutEvent>((event, emit) async {
      emit(CheckoutLoading());
      final result = await CheckoutRemoteDatasource().checkout(event.checkout);
      result.fold(
        (error) => emit(CheckoutError()),
        (success) => emit(CheckoutSuccess(checkout: success)),
      );
    });
  }
}
