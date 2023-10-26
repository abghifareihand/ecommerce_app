import 'package:ecommerce_app/common/constants.dart';
import 'package:ecommerce_app/common/theme.dart';
import 'package:ecommerce_app/data/models/response/cart_response_model.dart';
import 'package:flutter/material.dart';

class CheckoutCard extends StatelessWidget {
  final CartResponseModel cart;
  const CheckoutCard({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(cart.product.galleries[0].url),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.product.name,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Text(
                  formatCurrency(cart.product.priceToRupiah),
                  style: priceTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            '${cart.quantity} Items',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
