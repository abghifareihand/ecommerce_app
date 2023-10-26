import 'package:ecommerce_app/data/models/response/product_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteSuccess(products: [])) {
    on<AddFavoriteEvent>((event, emit) {
      final addFavorite = state as FavoriteSuccess;
      final updatedProducts = [
        ...addFavorite.products,
        event.product
      ];

      emit(FavoriteSuccess(products: updatedProducts));
    });

    on<RemoveFavoriteEvent>((event, emit) {
      final removeFavorite = state as FavoriteSuccess;
      final updatedProducts = [...removeFavorite.products];
      updatedProducts.removeWhere(
          (product) => product.id == event.product.id);

      emit(FavoriteSuccess(products: updatedProducts));
    });
  }
}
