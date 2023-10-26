

import 'package:ecommerce_app/data/datasources/remote/product_remote_datasource.dart';
import 'package:ecommerce_app/data/models/response/product_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsGetEvent>((event, emit) async {
      emit(ProductsLoading());
      final result = await ProductRemoteDatasource().getProducts();
      result.fold(
        (error) => emit(ProductsError(message: error)),
        (success) => emit(ProductsSuccess(products: success)),
      );
    });



    
  }
}
