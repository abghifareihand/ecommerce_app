import 'package:ecommerce_app/presentation/pages/auth/login_page.dart';
import 'package:ecommerce_app/presentation/pages/auth/register_page.dart';
import 'package:ecommerce_app/presentation/pages/cart/cart_page.dart';
import 'package:ecommerce_app/presentation/pages/chat/detail_chat_page.dart';
import 'package:ecommerce_app/presentation/pages/checkout/checkout_page.dart';
import 'package:ecommerce_app/presentation/pages/checkout/checkout_success_page.dart';
import 'package:ecommerce_app/presentation/pages/navbar/bottom_navbar.dart';
import 'package:ecommerce_app/presentation/pages/home/product_page.dart';
import 'package:ecommerce_app/presentation/pages/profile/edit_profile_page.dart';
import 'package:ecommerce_app/presentation/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => const SplashPage(),
      '/login': (context) => const LoginPage(),
      '/register': (context) => const RegisterPage(),
      '/navbar': (context) => const BottomNavbar(),
      '/detail-chat': (context) => const DetailChatPage(),
      '/edit-profile': (context) => const EditProfilePage(),
      '/product': (context) => const ProductPage(),
      '/cart': (context) => const CartPage(),
      '/checkout': (context) => const CheckoutPage(),
      '/checkout-success': (context) => const CheckoutSuccessPage(),
    };
  }
}
