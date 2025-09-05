import 'package:flutter/material.dart';

class AppColors {
  // New color palette
  static const Color primary = Color(0xFF127369);      // #127369 - Main dark green
  static const Color secondary = Color(0xFF10403B);    // #10403B - Darker green
  static const Color accent = Color(0xFF8AA6A3);       // #8AA6A3 - Medium green
  static const Color warning = Color(0xFF4C5958);      // #4C5958 - Dark grey
  static const Color danger = Color(0xFFBFBFBF);       // #BFBFBF - Light grey
  
  // Additional shades
  static const Color lightGreen = Color(0xFF8AA6A3);   // #8AA6A3 - Light green
  static const Color darkGreen = Color(0xFF10403B);    // #10403B - Dark green
  static const Color darkestGreen = Color(0xFF10403B); // #10403B - Darkest green
  static const Color blackGreen = Color(0xFF10403B);   // #10403B - Almost black green
  
  // Background and surface colors
  static const Color background = Color(0xFFBFBFBF);   // Light grey background
  static const Color surface = Colors.white;
  static const Color textPrimary = Color(0xFF10403B);  // Dark green for text
  static const Color textSecondary = Color(0xFF4C5958); // Dark grey for secondary text
  static const Color divider = Color(0xFF8AA6A3);      // Medium green for dividers
  
  // Gradient colors using the new palette
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, warning],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient warningGradient = LinearGradient(
    colors: [warning, danger],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient darkGradient = LinearGradient(
    colors: [secondary, primary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient lightGradient = LinearGradient(
    colors: [accent, surface],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Additional gradients for variety
  static const LinearGradient greenGradient = LinearGradient(
    colors: [primary, accent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient greyGradient = LinearGradient(
    colors: [warning, danger],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
