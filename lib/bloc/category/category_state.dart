part of 'category_bloc.dart';

abstract class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<ProductResponseModel> products;
  CategorySuccess({
    required this.products,
  });
}

final class CategoryError extends CategoryState {
  final String message;
  CategoryError({
    required this.message,
  });
}
