import 'package:ecommerce_app/bloc/auth/auth_bloc.dart';
import 'package:ecommerce_app/common/theme.dart';
import 'package:ecommerce_app/data/models/request/register_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
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
            fullnameInput(),
            usernameInput(),
            emailInput(),
            passwordInput(),
            buttonRegister(),
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
            'Register',
            style: primaryTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Text(
            'Sign Up and Happy Shopping',
            style: subtitleTextStyle,
          ),
        ],
      ),
    );
  }

  /// Fulname Input
  Widget fullnameInput() {
    return Container(
      margin: const EdgeInsets.only(top: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Full Name',
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
                    'assets/ic_name.png',
                    width: 17,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _nameController,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Your Full Name',
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

  /// Username Input
  Widget usernameInput() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Username',
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
                    'assets/ic_username.png',
                    width: 17,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _usernameController,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Your Username',
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

  /// Email Input
  Widget emailInput() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
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

  /// Button Register
  Widget buttonRegister() {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: priceColor,
              content: const Text('Register Success'),
            ),
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/navbar',
            (route) => false,
          );
        }

        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: alertColor,
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return Container(
          height: 50,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 30),
          child: TextButton(
            onPressed: () {
              final registerModel = RegisterRequestModel(
                name: _nameController.text,
                username: _usernameController.text,
                email: _emailController.text,
                password: _passwordController.text,
              );
              context.read<AuthBloc>().add(
                    AuthRegisterEvent(
                      registerRequestModel: registerModel,
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
              state is AuthLoading ? 'Loading...' : 'Register',
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
            'Already have an account? ',
            style: subtitleTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Login',
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
