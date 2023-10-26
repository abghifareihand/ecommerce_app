part of 'products_bloc.dart';


abstract class ProductsState {}

final class ProductsInitial extends ProductsState {}
final class ProductsLoading extends ProductsState {}
final class ProductsSuccess extends ProductsState {
  final List<ProductResponseModel> products;
  ProductsSuccess({
    required this.products,
  });
}
final class ProductsError extends ProductsState {
  final String message;
  ProductsError({
    required this.message,
  });
}
