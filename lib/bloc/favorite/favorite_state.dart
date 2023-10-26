part of 'favorite_bloc.dart';


abstract class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {
  final List<ProductResponseModel> products;
  FavoriteSuccess({
    required this.products,
  });
}

final class FavoriteError extends FavoriteState {
  final String message;
  FavoriteError({
    required this.message,
  });
}
