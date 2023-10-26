import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/common/constants.dart';
import 'package:ecommerce_app/data/datasources/local/auth_local_datasource.dart';
import 'package:ecommerce_app/data/models/request/login_request_model.dart';
import 'package:ecommerce_app/data/models/request/register_request_model.dart';
import 'package:ecommerce_app/data/models/response/auth_response_model.dart';
import 'package:ecommerce_app/data/models/response/user_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel registerRequestModel) async {
    final response = await http.post(
      Uri.parse(
        '$baseUrl/register',
      ),
      headers: {'Content-Type': 'application/json'},
      body: registerRequestModel.toJson(),
    );

    // print(response.body);

    if (response.statusCode == 200) {
      //print(response.statusCode);
      return Right(AuthResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Gagal Register');
    }
  }

  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel loginRequestModel) async {
    final response = await http.post(
      Uri.parse(
        '$baseUrl/login',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: loginRequestModel.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Gagal Login');
    }
  }

  Future<Either<String, UserResponseModel>> getUser() async {
    final token = await AuthLocalDatasource().getToken();
    final response = await http.get(
      Uri.parse(
        '$baseUrl/user',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    // print(response.body);

    if (response.statusCode == 200) {
      return Right(
          UserResponseModel.fromJson(jsonDecode(response.body)['data']));
    } else {
      return const Left('Gagal Get User');
    }
  }
}
