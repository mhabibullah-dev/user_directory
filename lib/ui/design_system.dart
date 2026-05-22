import 'package:flutter/material.dart';

class DesignTokens {
  // Colors
  static const Color surface = Color(0xFFFCF9F8);
  static const Color primary = Color(0xFF005DAC);
  static const Color onSurface = Color(0xFF1B1C1C);
  static const Color onSurfaceVariant = Color(0xFF414752);
  static const Color cardColor = Color(0xFFF0F4F8); // From Brand & Style notes
  static const Color error = Color(0xFFBA1A1A);

  // Spacing
  static const double base = 8.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double marginMobile = 16.0;

  // Shapes
  static const double borderRadius = 8.0;

  // Typography
  static const TextStyle headlineMd = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: onSurface,
  );

  static const TextStyle bodyLg = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: onSurface,
  );

  static const TextStyle bodyMd = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: onSurfaceVariant,
  );
  
  static const TextStyle labelMd = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: primary,
  );
}
