part of 'cart_bloc.dart';

abstract class CartState {}

final class CartInitial extends CartState {}
final class CartLoading extends CartState {}
final class CartSuccess extends CartState {
  final List<CartResponseModel> carts;
  CartSuccess({
    required this.carts,
  });
}
final class CartError extends CartState {}
