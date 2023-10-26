import 'package:ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/common/constants.dart';
import 'package:ecommerce_app/common/theme.dart';
import 'package:ecommerce_app/presentation/pages/cart/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget emptyCart() {
      return Container(
        width: double.infinity,
        color: backgroundColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img_cart_empty.png',
              width: 80,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Opss! Your Cart is Empty',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              'Let\'s find your favorite shoes',
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 44,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/navbar', (route) => false);
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget contentCart() {
      return BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartSuccess) {
            if (state.carts.isEmpty) {
              return emptyCart();
            }
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children:
                  state.carts.map((cart) => CartCard(cart: cart)).toList(),
            );
          }
          return Container();
        },
      );
    }

    Widget buttonCheckout() {
      return BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartSuccess) {
            if (state.carts.isEmpty) {
              return const SizedBox();
            }
            final total = state.carts
                .fold(0, (sum, product) => sum + product.getTotalPrice());
            return SizedBox(
              height: 180,
              child: Column(
                children: [
                  /// Total Price
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Text(
                          'Subtotal',
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          formatCurrency(total),
                          style: priceTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Divider(
                    thickness: 0.3,
                    color: subtitleColor,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),

                  /// Button
                  Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/checkout');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Continue to Checkout',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: primaryTextColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: const Text(
          'Your Cart',
        ),
        elevation: 0,
      ),
      body: contentCart(),
      bottomNavigationBar: buttonCheckout(),
    );
  }
}
