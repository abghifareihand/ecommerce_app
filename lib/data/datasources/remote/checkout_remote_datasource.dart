import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/common/constants.dart';
import 'package:ecommerce_app/data/datasources/local/auth_local_datasource.dart';
import 'package:ecommerce_app/data/models/request/checkout_request_model.dart';
import 'package:ecommerce_app/data/models/response/checkout_response_model.dart';
import 'package:http/http.dart' as http;

class CheckoutRemoteDatasource {
  Future<Either<String, CheckoutResponseModel>> checkout(
      CheckoutRequestModel checkoutRequestModel) async {
    final token = await AuthLocalDatasource().getToken();
    final response = await http.post(
      Uri.parse(
        '$baseUrl/checkout',
      ),
      headers: <String, String>{
        
        'Authorization': 'Bearer $token',
      },
      body: checkoutRequestModel.toJson(),
    );

    print(response.body);

    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      return Right(CheckoutResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Gagal Checkout');
    }
  }
}
