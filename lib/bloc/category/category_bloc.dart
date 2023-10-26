

import 'package:ecommerce_app/data/datasources/remote/category_remote_datasource.dart';
import 'package:ecommerce_app/data/models/response/product_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryGetEvent>((event, emit) async {
      emit(CategoryLoading());
      final result = await CategoryRemoteDatasource().getCategory(event.categoryId);
      result.fold(
        (error) => emit(CategoryError(message: error)),
        (success) => emit(CategorySuccess(products: success)),
      );
    });
  }
}
