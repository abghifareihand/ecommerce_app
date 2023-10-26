part of 'cart_bloc.dart';

abstract class CartEvent {}

// Menambahkan produk ke keranjang
class AddToCartEvent extends CartEvent {
  final CartResponseModel cart;
  AddToCartEvent({
    required this.cart,
  });
}

// Menghapus produk dari keranjang
class RemoveFromCartEvent extends CartEvent {
  final CartResponseModel cart;
  RemoveFromCartEvent({
    required this.cart,
  });
}

// Menambahkan quantity
class AddQuantityEvent extends CartEvent {
  final int cartId;

  AddQuantityEvent({required this.cartId});

  
}

// Mengurangi quantity
class ReduceQuantityEvent extends CartEvent {
  final int cartId;

  ReduceQuantityEvent({required this.cartId});
}