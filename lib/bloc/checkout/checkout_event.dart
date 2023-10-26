part of 'checkout_bloc.dart';


abstract class CheckoutEvent {}

class PayCheckoutEvent extends CheckoutEvent {
  final CheckoutRequestModel checkout;
  PayCheckoutEvent({
    required this.checkout,
  });
}
