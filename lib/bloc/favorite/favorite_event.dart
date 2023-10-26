part of 'favorite_bloc.dart';

abstract class FavoriteEvent {}


class AddFavoriteEvent extends FavoriteEvent {
  final ProductResponseModel product;
  AddFavoriteEvent({
    required this.product,
  });
}

class RemoveFavoriteEvent extends FavoriteEvent {
  final ProductResponseModel product;
  RemoveFavoriteEvent({
    required this.product,
  });
}