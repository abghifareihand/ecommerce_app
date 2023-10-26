import 'package:ecommerce_app/bloc/auth/auth_bloc.dart';
import 'package:ecommerce_app/bloc/category/category_bloc.dart';
import 'package:ecommerce_app/bloc/products/products_bloc.dart';
import 'package:ecommerce_app/common/theme.dart';
import 'package:ecommerce_app/presentation/pages/home/widgets/product_card.dart';
import 'package:ecommerce_app/presentation/pages/home/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<AuthBloc>().add(AuthGetUserEvent());
    context.read<ProductsBloc>().add(ProductsGetEvent());
    context.read<CategoryBloc>().add(CategoryGetEvent(categoryId: index));
    super.initState();
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        header(),
        categories(),
        popularProductsTitle(),
        popularProducts(),
        newArrivalsTitle(),
        newArrivals(),
      ],
    );
  }

  Widget header() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthUserSuccess) {
          final user = state.user;
          return Container(
            margin: const EdgeInsets.only(
              top: 30,
              left: 30,
              right: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo, ${user.name}',
                        style: primaryTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        '@${user.username}',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 54,
                  height: 54,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/img_profile.png',
                      ),
                      fit: BoxFit.cover,
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

  Widget categoryButton(String text, int indexCategory) {
    return GestureDetector(
      onTap: () {
        index = indexCategory;
        context.read<CategoryBloc>().add(CategoryGetEvent(categoryId: index));
        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        decoration: indexCategory == index
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: primaryColor,
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: subtitleColor),
                color: transparentColor,
              ),
        child: Text(
          text,
          style: indexCategory == index
              ? primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 13,
                )
              : subtitleTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 13,
                ),
        ),
      ),
    );
  }

  Widget categories() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 30),
            categoryButton('All Shoes', 0),
            categoryButton('Running', 5),
            categoryButton('Training', 4),
            categoryButton('Basketball', 3),
            categoryButton('Hiking', 2),
          ],
        ),
      ),
    );
  }

  Widget popularProductsTitle() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        left: 30,
        right: 30,
      ),
      child: Text(
        'Popular Products',
        style: primaryTextStyle.copyWith(
          fontSize: 22,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  Widget popularProducts() {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategorySuccess) {
          return Container(
            margin: const EdgeInsets.only(
              top: 14,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Row(
                      children: state.products
                          .map(
                            (product) => ProductCard(
                              product: product,
                            ),
                          )
                          .toList()),
                ],
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        );
      },
    );
  }

  Widget newArrivalsTitle() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        left: 30,
        right: 30,
      ),
      child: Text(
        'New Arrivals',
        style: primaryTextStyle.copyWith(
          fontSize: 22,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  Widget newArrivals() {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return Container(
            margin: const EdgeInsets.only(top: 14),
            child: Column(
              children: state.products
                  .map(
                    (product) => ProductTile(product: product),
                  )
                  .toList(),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
