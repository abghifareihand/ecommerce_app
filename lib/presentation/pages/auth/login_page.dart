import 'package:ecommerce_app/bloc/auth/auth_bloc.dart';
import 'package:ecommerce_app/common/theme.dart';
import 'package:ecommerce_app/data/datasources/local/auth_local_datasource.dart';
import 'package:ecommerce_app/data/models/request/login_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          children: [
            header(),
            emailInput(),
            passwordInput(),
            buttonLogin(context),
          ],
        ),
      ),
      bottomNavigationBar: footer(context),
    );
  }

  /// Header
  Widget header() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login',
            style: primaryTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Text(
            'Sign In to Countinue',
            style: subtitleTextStyle,
          ),
        ],
      ),
    );
  }

  /// Email Input
  Widget emailInput() {
    return Container(
      margin: const EdgeInsets.only(top: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email Address',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    'assets/ic_email.png',
                    width: 17,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _emailController,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Your Email Address',
                        hintStyle: subtitleTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Password Input
  Widget passwordInput() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    'assets/ic_password.png',
                    width: 17,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Your Password',
                        hintStyle: subtitleTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Button Login
  Widget buttonLogin(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthSuccess) {
          await AuthLocalDatasource().saveToken(
            state.authResponseModel.data.accessToken,
          );
          print('token: ${state.authResponseModel.data.accessToken}');
          if (!mounted) return;
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/navbar',
            (route) => false,
          );
          showCustomSnackbar(context, 'Login Success', secondaryColor);
        }

        if (state is AuthError) {
          showCustomSnackbar(context, 'Login Failed', alertColor);
        }
      },
      builder: (context, state) {
        print(state);
        return Container(
          height: 50,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 30),
          child: TextButton(
            onPressed: () {
              final loginModel = LoginRequestModel(
                email: _emailController.text,
                password: _passwordController.text,
              );
              context.read<AuthBloc>().add(
                    AuthLoginEvent(
                      loginRequestModel: loginModel,
                    ),
                  );
            },
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              state is AuthLoading ? 'Loading...' : 'Login',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ),
        );
      },
    );
  }

  /// Footer
  Widget footer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account? ',
            style: subtitleTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Text(
              'Register',
              style: purpleTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
