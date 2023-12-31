import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:another_flushbar/flushbar.dart';

Color primaryColor = const Color(0xFF6C5ECF);
Color secondaryColor = const Color(0xFF38ABBE);
Color alertColor = const Color(0xFFED6363);
Color successColor = const Color(0xFF5AA861);
Color priceColor = const Color(0xFF2C96F1);
Color backgroundColor1 = const Color(0xFF1F1D2B);
Color backgroundColor2 = const Color(0xFF2B2937);
Color backgroundColor3 = const Color(0xFF242231);
Color backgroundColor4 = const Color(0xFF252836);
Color backgroundColor5 = const Color(0xFF2B2844);
Color backgroundColor6 = const Color(0xFFECEDEF);
Color primaryTextColor = const Color(0xFFF1F0F2);
Color secondaryTextColor = const Color(0xFF999999);
Color subtitleColor = const Color(0xFF504F5E);
Color greyColor = const Color(0xFF808191);
Color blackColor = const Color(0xFF2E2E2E);
Color transparentColor = Colors.transparent;

TextStyle primaryTextStyle = GoogleFonts.poppins(color: primaryTextColor);
TextStyle secondaryTextStyle = GoogleFonts.poppins(color: secondaryTextColor);
TextStyle subtitleTextStyle = GoogleFonts.poppins(color: subtitleColor);
TextStyle priceTextStyle = GoogleFonts.poppins(color: priceColor);
TextStyle purpleTextStyle = GoogleFonts.poppins(color: primaryColor);
TextStyle blackTextStyle = GoogleFonts.poppins(color: blackColor);
TextStyle alertTextStyle = GoogleFonts.poppins(color: alertColor);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

void showCustomSnackbar(BuildContext context, String message, Color color) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: color,
    duration: const Duration(seconds: 2),
  ).show(context);
}
