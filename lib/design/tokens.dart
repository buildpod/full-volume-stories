import 'package:flutter/widgets.dart';

class FVTokens {
  FVTokens._();

  // Shared neutrals
  static const Color ink = Color(0xFF3A2E27);
  static const Color surface = Color(0xFFFBF7F1);
  static const Color surfaceAlt = Color(0xFFF2EADF);

  // Mode A palette
  static const Color aPrimary = Color(0xFF7FA6A6);
  static const Color aAccent = Color(0xFFA9C2D4);
  static const Color aCalm = Color(0xFFE8E0D4);

  // Mode B palette
  static const Color bPrimary = Color(0xFFE0A24E);
  static const Color bAccent = Color(0xFF6FB0A8);
  static const Color bGlow = Color(0xFFF7E3C4);

  // Spacing
  static const double xs = 4.0;
  static const double s = 8.0;
  static const double m = 16.0;
  static const double l = 24.0;
  static const double xl = 40.0;

  // Radius
  static const double radiusCard = 16.0;
  static const double radiusButton = 12.0;

  // Type tokens
  static const String fontFamily = 'Nunito';
  static const double bodyLineHeight = 1.6;

  // Behaviour tokens
  static const int aMaxFocalElements = 1;
  static const int bMaxFocalElements = 3;
  
  static const double aMinTapTarget = 56.0;
  static const double bMinTapTarget = 48.0;

  static const bool aAutoplay = false;
  static const bool bAutoplay = true;
}
