import 'dart:async';

import 'package:ecommerce_app/common/theme.dart';
import 'package:ecommerce_app/data/datasources/local/auth_local_datasource.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
   
    // Tambahkan penundaan selama 3 detik sebelum pemeriksaan login.
    Future.delayed(const Duration(seconds: 3), () {
      checkUserLoginStatus();
    });
  }

  Future<void> checkUserLoginStatus() async {
    final isLoggedIn = await AuthLocalDatasource().isUserLoggedIn();
    if (isLoggedIn) {
      print(isLoggedIn);
      // Redirect ke halaman utama atau dashboard karena pengguna sudah login.
      Navigator.pushReplacementNamed(context, '/navbar');
    } else {
      // Redirect ke halaman login karena pengguna belum login.
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img_splash.png'),
            ),
          ),
        ),
      ),
    );
  }
}
