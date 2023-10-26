import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/bloc/favorite/favorite_bloc.dart';
import 'package:ecommerce_app/common/constants.dart';
import 'package:ecommerce_app/common/theme.dart';
import 'package:ecommerce_app/data/models/response/cart_response_model.dart';
import 'package:ecommerce_app/data/models/response/product_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  final ProductResponseModel product;
  const ProductPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/img_shoes_1.png',
    'assets/img_shoes_2.png',
    'assets/img_shoes_3.png',
  ];

  List familiarShoes = [
    'assets/img_shoes_1.png',
    'assets/img_shoes_2.png',
    'assets/img_shoes_3.png',
    'assets/img_shoes_1.png',
    'assets/img_shoes_2.png',
    'assets/img_shoes_3.png',
    'assets/img_shoes_1.png',
    'assets/img_shoes_2.png',
    'assets/img_shoes_3.png',
    'assets/img_shoes_1.png',
    'assets/img_shoes_2.png',
    'assets/img_shoes_3.png',
  ];

  int currentIndex = 0;

  Future<void> showSuccessDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width - (2 * 30),
        child: AlertDialog(
          backgroundColor: backgroundColor3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: primaryTextColor,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/ic_success.png',
                  width: 100,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Hurray :)',
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Item added successfully',
                  style: secondaryTextStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 154,
                  height: 44,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'View My Cart',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : const Color(0xffC4C4C4),
        ),
      );
    }

    Widget familiarShoesCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.chevron_left,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.shopping_bag,
                    color: backgroundColor1,
                  ),
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: widget.product.galleries
                .map(
                  (image) => Image.network(
                    image.url,
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.product.galleries.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          ),
        ],
      );
    }

    Widget contentProduct() {
      int index = -1;
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: backgroundColor1,
        ),
        child: Column(
          children: [
            /// Header
            Container(
              margin: const EdgeInsets.only(
                top: 30,
                left: 30,
                right: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          widget.product.category.name,
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<FavoriteBloc, FavoriteState>(
                    builder: (context, state) {
                      if (state is FavoriteSuccess) {
                        final isFavorite = state.products
                            .any((product) => product.id == widget.product.id);

                        return InkWell(
                          onTap: () {
                            if (isFavorite) {
                              // Produk sudah ada dalam favorit, sehingga kita ingin menghapusnya.
                              context.read<FavoriteBloc>().add(
                                    RemoveFavoriteEvent(
                                      product: widget.product,
                                    ),
                                  );
                            } else {
                              // Produk belum ada dalam favorit, tambahkan ke favorit.
                              context.read<FavoriteBloc>().add(
                                    AddFavoriteEvent(
                                      product: widget.product,
                                    ),
                                  );
                            }
                          },
                          child: Image.asset(
                            isFavorite
                                ? 'assets/btn_favorite_active.png'
                                : 'assets/btn_favorite.png',
                            width: 46,
                          ),
                        );
                      }
                      return Image.asset(
                        'assets/btn_favorite.png',
                        width: 46,
                      );
                    },
                  ),
                ],
              ),
            ),

            /// Price
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                top: 20,
                left: 30,
                right: 30,
              ),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price starts from',
                    style: primaryTextStyle,
                  ),
                  Text(
                    formatCurrency(widget.product.priceToRupiah),
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),

            /// Description
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                top: 30,
                left: 30,
                right: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    widget.product.description,
                    style: subtitleTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            /// Familiar Shoes
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Familiar Shoes',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: familiarShoes.map((image) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            left: index == 0 ? 30 : 0,
                          ),
                          child: familiarShoesCard(image),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            /// Button
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(30),
              child: Row(
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/btn_chat.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  // mengisi ruang kosong
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartSuccess) {
                        return Expanded(
                          child: SizedBox(
                            height: 54,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<CartBloc>().add(
                                      AddToCartEvent(
                                        cart: CartResponseModel(
                                          id: widget.product.id,
                                          product: widget.product,
                                          quantity: 1,
                                        ),
                                      ),
                                    );
                                showSuccessDialog();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Add to Cart',
                                style: primaryTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      body: ListView(
        children: [
          header(),
          contentProduct(),
        ],
      ),
    );
  }
}
