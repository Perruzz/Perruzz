import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MangaTheme {
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF222222);
  static const Color lightGrey = Color(0xFF888888);

  static ThemeData get theme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: white,
    primaryColor: black,
    colorScheme: const ColorScheme.light(
      primary: black,
      onPrimary: white,
      surface: white,
      onSurface: black,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.bebasNeue(
        fontSize: 80,
        color: black,
        height: 0.9,
        letterSpacing: 2,
      ),
      displayMedium: GoogleFonts.bebasNeue(
        fontSize: 56,
        color: black,
        height: 1.0,
        letterSpacing: 2,
      ),
      displaySmall: GoogleFonts.bebasNeue(
        fontSize: 40,
        color: black,
        height: 1.1,
        letterSpacing: 1.5,
      ),
      headlineMedium: GoogleFonts.bebasNeue(
        fontSize: 32,
        color: black,
        letterSpacing: 1.5,
      ),
      titleLarge: GoogleFonts.oswald(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: black,
        letterSpacing: 0.5,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: black,
        height: 1.6,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: grey,
        height: 1.6,
      ),
    ),
  );
}