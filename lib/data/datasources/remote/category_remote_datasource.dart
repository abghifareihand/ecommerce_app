import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/common/constants.dart';
import 'package:ecommerce_app/data/models/response/product_response_model.dart';
import 'package:http/http.dart' as http;

class CategoryRemoteDatasource {
  Future<Either<String, List<ProductResponseModel>>> getCategory(
      int idCategory) async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/products?categories=$idCategory',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    print(response.body);

    if (response.statusCode == 200) {
      return Right(List<ProductResponseModel>.from(
        jsonDecode(response.body)['data']['data'].map(
          (product) => ProductResponseModel.fromJson(product),
        ),
      ).toList());
   
    } else {
      return const Left('Gagal Get Product Category');
    }
  }
}
