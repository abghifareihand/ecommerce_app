import 'package:ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/bloc/checkout/checkout_bloc.dart';
import 'package:ecommerce_app/common/constants.dart';
import 'package:ecommerce_app/common/theme.dart';
import 'package:ecommerce_app/data/models/request/checkout_request_model.dart';
import 'package:ecommerce_app/presentation/pages/checkout/widgets/checkout_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget contentCheckout() {
      return ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        children: [
          /// List items
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartSuccess) {
                return Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'List Items',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      Column(
                        children: state.carts
                            .map(
                              (cart) => CheckoutCard(
                                cart: cart,
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                );
              }
              return Container();
            },
          ),

          /// Address Details
          Container(
            margin: const EdgeInsets.only(
              top: 30,
            ),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address Details',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/ic_store_location.png',
                          width: 40,
                        ),
                        Image.asset(
                          'assets/ic_line.png',
                          height: 30,
                        ),
                        Image.asset(
                          'assets/ic_your_address.png',
                          width: 40,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Store Location',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          'Adidcas Core',
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'Your Address',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          'Jakarta',
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Payment Summary
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartSuccess) {
                final total = state.carts
                    .fold(0, (sum, product) => sum + product.getTotalPrice());
                final quantity = state.carts
                    .fold(0, (sum, product) => sum + product.quantity);
                return Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: backgroundColor4,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Summary',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Quantity',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '$quantity Items',
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Price',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            formatCurrency(total),
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Free',
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      const Divider(
                        thickness: 1,
                        color: Color(0xff2E3141),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: priceTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            formatCurrency(total),
                            style: priceTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
              return Container();
            },
          ),

          /// Checkout Button
          const SizedBox(
            height: 30.0,
          ),
          const Divider(
            thickness: 1,
            color: Color(0xff2E3141),
          ),

          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartSuccess) {
                final totalQuantity = state.carts
                    .fold(0, (sum, product) => sum + product.quantity);
                final totalPrice = state.carts
                    .fold(0, (sum, product) => sum + product.getTotalPrice());
                return Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: TextButton(
                    onPressed: () {
                      final requestCheckout = CheckoutRequestModel(
                        address: 'Jakarta',
                        items: state.carts
                            .map(
                              (cart) => Item(
                                id: cart.product.id,
                                quantity: cart.quantity,
                              ),
                            )
                            .toList(),
                        status: 'PENDING',
                        totalPrice: totalPrice,
                        shippingPrice: 0,
                      );
                      context
                          .read<CheckoutBloc>()
                          .add(PayCheckoutEvent(checkout: requestCheckout));
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Checkout Now',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Checkout Details',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
      body: contentCheckout(),
    );
  }
}
