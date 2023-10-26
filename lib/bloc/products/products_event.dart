part of 'products_bloc.dart';

abstract class ProductsEvent {}

class ProductsGetEvent extends ProductsEvent {}

class ProductAddFavoriteEvent extends ProductsEvent {
  final ProductResponseModel productResponseModel;
  ProductAddFavoriteEvent({
    required this.productResponseModel,
  });
}

class ProductRemoveFavoriteEvent extends ProductsEvent {
  final ProductResponseModel productResponseModel;
  ProductRemoveFavoriteEvent({
    required this.productResponseModel,
  });
}
