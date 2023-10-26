import 'package:ecommerce_app/bloc/favorite/favorite_bloc.dart';
import 'package:ecommerce_app/common/theme.dart';
import 'package:ecommerce_app/presentation/pages/favorite/widgets/favorite_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    /// Appbar
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Favorite Shoes',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    /// Empty Favorite
    Widget emptyFavorite() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img_favorite_empty.png',
                width: 80,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'You don\'t have dream shoes?',
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
                style: secondaryTextStyle,
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
                      vertical: 10,
                      horizontal: 24,
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
        ),
      );
    }

    /// Content Favorite
    Widget contentFavorite() {
      return BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteSuccess) {
            if (state.products.isEmpty) {
              return emptyFavorite();
            }
            return Expanded(
              child: Container(
                width: double.infinity,
                color: backgroundColor3,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  children: state.products
                      .map(
                        (product) => FavoriteCard(
                          product: product,
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          }

          return Container();
        },
      );
    }

    return Column(
      children: [
        header(),
        contentFavorite(),
      ],
    );
  }
}
