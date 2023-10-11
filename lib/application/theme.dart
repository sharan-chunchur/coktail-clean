import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// const Color.fromARGB(255, 131, 57, 0),
final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor:  const Color.fromARGB(255, 32, 26, 23),
      brightness: Brightness.dark,
    ),
    textTheme: textTheme,
    scrollbarTheme: const ScrollbarThemeData().copyWith(
      thumbColor: MaterialStateProperty.all(Colors.orange),
    ));

final TextTheme textTheme = TextTheme(
  displayLarge: GoogleFonts.abrilFatface(
      fontSize: 97,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
      color: Colors.white),
  displayMedium: GoogleFonts.abrilFatface(
      fontSize: 61,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
      color: Colors.white),
  displaySmall: GoogleFonts.abrilFatface(
      fontSize: 48, fontWeight: FontWeight.w400, color: Colors.grey),

  headlineLarge: GoogleFonts.abrilFatface(
      fontSize: 48, fontWeight: FontWeight.w400, color: Colors.white),
  headlineMedium: GoogleFonts.abrilFatface(
      fontSize: 34,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: Colors.white),
  headlineSmall: GoogleFonts.abrilFatface(
      fontSize: 24, fontWeight: FontWeight.w400, color: Colors.grey),

  titleLarge: GoogleFonts.abrilFatface(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: Colors.white),
  titleMedium: GoogleFonts.abrilFatface(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 1,
      color: Colors.white),
  titleSmall: GoogleFonts.abrilFatface(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: Colors.grey),

  bodyLarge: GoogleFonts.abrilFatface(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: Colors.white),
  bodyMedium: GoogleFonts.abrilFatface(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.8,
      color: Colors.grey),
  bodySmall: GoogleFonts.abrilFatface(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: Colors.grey),

  labelLarge: GoogleFonts.abrilFatface(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      color: Colors.white),
  labelMedium: GoogleFonts.abrilFatface(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
      color: Colors.white),
  labelSmall: GoogleFonts.abrilFatface(
      fontSize: 6,
      fontWeight: FontWeight.w300,
      letterSpacing: 1.5,
      color: Colors.grey),
);
