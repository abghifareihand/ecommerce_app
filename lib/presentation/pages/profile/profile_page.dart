import 'package:ecommerce_app/bloc/auth/auth_bloc.dart';
import 'package:ecommerce_app/common/theme.dart';
import 'package:ecommerce_app/data/datasources/local/auth_local_datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<AuthBloc>().add(AuthGetUserEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header(),
        contentProfile(context),
      ],
    );
  }

  Widget header() {
    return AppBar(
      backgroundColor: backgroundColor1,
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthUserSuccess) {
                return Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/img_profile.png',
                        width: 64,
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.user.name,
                            style: primaryTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            state.user.username,
                            style: subtitleTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await AuthLocalDatasource().removeToken();
                        if (!mounted) return;
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login', (route) => false);
                      },
                      child: Image.asset(
                        'assets/btn_exit.png',
                        width: 20,
                      ),
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget menuItem(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: secondaryTextStyle.copyWith(
              fontSize: 13,
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: primaryTextColor,
          ),
        ],
      ),
    );
  }

  Widget contentProfile(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: backgroundColor3,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Account',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/edit-profile');
              },
              child: menuItem('Edit Profile'),
            ),
            menuItem('Your Orders'),
            menuItem('Help'),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              'General',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            menuItem('Privacy & Policy'),
            menuItem('Term of Service'),
            menuItem('Rate App'),
          ],
        ),
      ),
    );
  }
}
