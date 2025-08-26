import 'package:flutter/material.dart';

class AppColors {
  // Green color palette
  static const Color primary = Color(0xFF52B788);      // #52b788 - Main green
  static const Color secondary = Color(0xFF74C69D);    // #74c69d - Light green
  static const Color accent = Color(0xFF95D5B2);       // #95d5b2 - Lighter green
  static const Color warning = Color(0xFFB7E4C7);      // #b7e4c7 - Very light green
  static const Color danger = Color(0xFF40916C);       // #40916c - Dark green
  
  // Additional green shades
  static const Color lightGreen = Color(0xFFD8F3DC);   // #d8f3dc - Lightest green
  static const Color darkGreen = Color(0xFF2D6A4F);    // #2d6a4f - Darker green
  static const Color darkestGreen = Color(0xFF1B4332); // #1b4332 - Darkest green
  static const Color blackGreen = Color(0xFF081C15);   // #081c15 - Almost black green
  
  // Background and surface colors
  static const Color background = Color(0xFFE9E9E9);   // Light grey background
  static const Color surface = Colors.white;
  static const Color textPrimary = Color(0xFF1B4332);  // Dark green for text
  static const Color textSecondary = Color(0xFF2D6A4F); // Medium green for secondary text
  static const Color divider = Color(0xFFD8F3DC);      // Light green for dividers
  
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
    colors: [warning, lightGreen],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient darkGradient = LinearGradient(
    colors: [darkGreen, darkestGreen],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient lightGradient = LinearGradient(
    colors: [lightGreen, surface],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
