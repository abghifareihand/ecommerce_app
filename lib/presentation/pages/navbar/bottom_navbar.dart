import 'package:ecommerce_app/common/theme.dart';
import 'package:ecommerce_app/presentation/pages/profile/profile_page.dart';
import 'package:ecommerce_app/presentation/pages/chat/chat_page.dart';
import 'package:ecommerce_app/presentation/pages/favorite/favorite_page.dart';
import 'package:ecommerce_app/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: selectIndex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customNavbar(),
      body: IndexedStack(
        index: selectIndex,
        children: const [
          HomePage(),
          ChatPage(),
          FavoritePage(),
          ProfilePage(),
        ],
      ),
    );
  }

  Widget cartButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/cart');
      },
      backgroundColor: secondaryColor,
      child: Image.asset(
        'assets/ic_cart.png',
        width: 20,
      ),
    );
  }

  Widget customNavbar() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(30),
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: backgroundColor4,
          currentIndex: selectIndex,
          onTap: (index) {
            //print(index);
            setState(() {
              selectIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                child: Image.asset(
                  'assets/ic_home.png',
                  width: 20,
                  color: selectIndex == 0 ? primaryColor : greyColor,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                child: Image.asset(
                  'assets/ic_chat.png',
                  width: 20,
                  color: selectIndex == 1 ? primaryColor : greyColor,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                child: Image.asset(
                  'assets/ic_favorite.png',
                  width: 20,
                  color: selectIndex == 2 ? primaryColor : greyColor,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                child: Image.asset(
                  'assets/ic_profile.png',
                  width: 20,
                  color: selectIndex == 3 ? primaryColor : greyColor,
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
