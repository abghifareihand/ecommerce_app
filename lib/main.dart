import 'package:ecommerce_app/bloc/auth/auth_bloc.dart';
import 'package:ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/bloc/category/category_bloc.dart';
import 'package:ecommerce_app/bloc/checkout/checkout_bloc.dart';
import 'package:ecommerce_app/bloc/favorite/favorite_bloc.dart';
import 'package:ecommerce_app/bloc/products/products_bloc.dart';
import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => ProductsBloc(),
        ),
        BlocProvider(
          create: (context) => FavoriteBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
