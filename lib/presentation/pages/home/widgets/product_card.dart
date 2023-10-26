import 'package:ecommerce_app/common/constants.dart';
import 'package:ecommerce_app/common/theme.dart';
import 'package:ecommerce_app/data/models/response/product_response_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductResponseModel product;
  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.pushNamed(
          context,
          '/product',
          arguments: product,
        );
      },
      child: Container(
        width: 215,
        height: 278,
        margin: const EdgeInsets.only(right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffECEDEF),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Image.network(
              product.galleries[0].url,
              width: 215,
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.name,
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    product.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                   formatCurrency(product.priceToRupiah),
                    style: priceTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
