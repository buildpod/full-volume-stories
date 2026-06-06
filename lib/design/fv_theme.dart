import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../domain/models.dart';
import 'tokens.dart';

ThemeData buildTheme(AppMode mode) {
  final isModeA = mode == AppMode.neurodivergent;
  
  final primaryColor = isModeA ? FVTokens.aPrimary : FVTokens.bPrimary;
  final accentColor = isModeA ? FVTokens.aAccent : FVTokens.bAccent;
  final canvasColor = isModeA ? FVTokens.aCalm : FVTokens.bGlow;
  
  final TextTheme baseTextTheme = GoogleFonts.nunitoTextTheme();
  
  final TextTheme textTheme = baseTextTheme.apply(
    bodyColor: FVTokens.ink,
    displayColor: FVTokens.ink,
  ).copyWith(
    bodyMedium: GoogleFonts.nunito(
      color: FVTokens.ink,
      height: FVTokens.bodyLineHeight,
      fontSize: isModeA ? 20.0 : 16.0,
    ),
  );

  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: FVTokens.surface,
    canvasColor: canvasColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: accentColor,
      surface: FVTokens.surface,
      onSurface: FVTokens.ink,
      onPrimary: FVTokens.ink,
    ),
    textTheme: textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: FVTokens.ink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(FVTokens.radiusButton),
        ),
      ),
    ),
    cardTheme: CardThemeData(
      color: FVTokens.surfaceAlt,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FVTokens.radiusCard),
      ),
    ),
  );
}
