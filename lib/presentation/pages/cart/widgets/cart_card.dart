import 'package:ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/common/constants.dart';
import 'package:ecommerce_app/common/theme.dart';
import 'package:ecommerce_app/data/models/response/cart_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCard extends StatelessWidget {
  final CartResponseModel cart;
  const CartCard({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor4,
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  cart.product.galleries[0].url,
                  width: 60,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cart.product.name,
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      formatCurrency(cart.product.priceToRupiah),
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      context
                          .read<CartBloc>()
                          .add(AddQuantityEvent(cartId: cart.id));
                    },
                    child: Image.asset(
                      'assets/btn_add.png',
                      width: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    cart.quantity.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  InkWell(
                    onTap: () {
                      context
                          .read<CartBloc>()
                          .add(ReduceQuantityEvent(cartId: cart.id));
                    },
                    child: Image.asset(
                      'assets/btn_min.png',
                      width: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          InkWell(
            onTap: () {
              context.read<CartBloc>().add(RemoveFromCartEvent(cart: cart));
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/ic_trash.png',
                  width: 10,
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Text(
                  'Remove',
                  style: alertTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
