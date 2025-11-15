import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Color(0xFF0A0E21),
    
  );
  static final buttonTextColor = Color(0xff121212);
  static final buttonBgColor = Color(0xffffffff);
  static final secondaryButtonBgColor = Color(0xfff2f2f2);
  static final secondaryButtonTextColor = Color(0xff7a7a7a);
  static final appBarColor = Color(0xff121212);
  static final scaffoldBgColor = Color(0xff0a0e21);

  static ThemeData get textTheme {
    return ThemeData(textTheme: GoogleFonts.schibstedGroteskTextTheme());
  }
}
