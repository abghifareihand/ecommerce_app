import 'package:ecommerce_app/bloc/favorite/favorite_bloc.dart';
import 'package:ecommerce_app/common/theme.dart';
import 'package:ecommerce_app/data/models/response/product_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCard extends StatelessWidget {
  final ProductResponseModel product;
  const FavoriteCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              product.galleries[0].url,
              width: 60,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '\$${product.price}',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              context
                  .read<FavoriteBloc>()
                  .add(RemoveFavoriteEvent(product: product));
            },
            child: Image.asset(
              'assets/btn_favorite_active.png',
              width: 34,
            ),
          ),
        ],
      ),
    );
  }
}
