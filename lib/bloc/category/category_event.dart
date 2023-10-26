part of 'category_bloc.dart';


abstract class CategoryEvent {}

class CategoryGetEvent extends CategoryEvent {
  final int categoryId;
  CategoryGetEvent({
    required this.categoryId,
  });
}
