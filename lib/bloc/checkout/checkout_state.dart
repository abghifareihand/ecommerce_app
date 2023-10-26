part of 'checkout_bloc.dart';

abstract class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutSuccess extends CheckoutState {
  final CheckoutResponseModel checkout;
  CheckoutSuccess({
    required this.checkout,
  });
}

final class CheckoutError extends CheckoutState {}
