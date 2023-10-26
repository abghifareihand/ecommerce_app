import 'package:ecommerce_app/data/models/response/cart_response_model.dart';
import 'package:ecommerce_app/data/models/response/product_response_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartSuccess(carts: [])) {
    on<AddToCartEvent>((event, emit) {
      // Mengambil status Cart saat ini
      final addCart = state as CartSuccess;

      // Menyalin daftar keranjang saat ini ke dalam daftar yang diperbarui
      final List<CartResponseModel> updatedCarts = [...addCart.carts];

      // Mencari indeks produk yang sudah ada di dalam keranjang
      final existingIndex = updatedCarts
          .indexWhere((element) => element.product.id == event.cart.product.id);

      // Jika produk sudah ada di dalam keranjang
      if (existingIndex != -1) {
        // Perbarui jumlah produk yang ada di keranjang
        updatedCarts[existingIndex] = CartResponseModel(
          id: updatedCarts[existingIndex].id,
          product: updatedCarts[existingIndex].product,
          quantity: updatedCarts[existingIndex].quantity + 1,
        );
      } else {
        // Jika produk belum ada di dalam keranjang, tambahkan produk tersebut ke keranjang
        updatedCarts.add(event.cart);
      }

      // Kirim status yang diperbarui ke Bloc
      emit(CartSuccess(carts: updatedCarts));
    });

    on<RemoveFromCartEvent>((event, emit) {
      final removeCart = state as CartSuccess;
      final updatedCarts = [...removeCart.carts];
      updatedCarts.remove(event.cart);
      emit(CartSuccess(carts: updatedCarts));
    });

    on<AddQuantityEvent>((event, emit) {
      final addCart = state as CartSuccess;
      final updatedCarts = List<CartResponseModel>.from(addCart.carts);
      final existingIndex =
          updatedCarts.indexWhere((cart) => cart.id == event.cartId);
      if (existingIndex != -1) {
        updatedCarts[existingIndex] = updatedCarts[existingIndex]
            .copyWith(quantity: updatedCarts[existingIndex].quantity + 1);
      }
      emit(CartSuccess(carts: updatedCarts));
    });

    on<ReduceQuantityEvent>((event, emit) {
      final addCart = state as CartSuccess;
      final updatedCarts = List<CartResponseModel>.from(addCart.carts);
      final existingIndex =
          updatedCarts.indexWhere((cart) => cart.id == event.cartId);

      if (existingIndex != -1) {
        if (updatedCarts[existingIndex].quantity > 1) {
          updatedCarts[existingIndex] = updatedCarts[existingIndex]
              .copyWith(quantity: updatedCarts[existingIndex].quantity - 1);
        }
      }

      emit(CartSuccess(carts: updatedCarts));
    });
  }
}
