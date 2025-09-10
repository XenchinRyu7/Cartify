import 'package:flutter/material.dart';

/// Modern color palette for Cartify e-commerce app
/// Inspired by contemporary design trends with professional and trendy colors
class AppColors {
  // Primary Colors - Modern Blue Gradient
  static const Color primary = Color(0xFF6366F1); // Indigo 500
  static const Color primaryLight = Color(0xFF818CF8); // Indigo 400
  static const Color primaryDark = Color(0xFF4F46E5); // Indigo 600
  static const Color primaryContainer = Color(0xFFE0E7FF); // Indigo 100

  // Secondary Colors - Warm Orange
  static const Color secondary = Color(0xFFF59E0B); // Amber 500
  static const Color secondaryLight = Color(0xFFFBBF24); // Amber 400
  static const Color secondaryDark = Color(0xFFD97706); // Amber 600
  static const Color secondaryContainer = Color(0xFFFEF3C7); // Amber 100

  // Accent Colors - Success Green
  static const Color accent = Color(0xFF10B981); // Emerald 500
  static const Color accentLight = Color(0xFF34D399); // Emerald 400
  static const Color accentDark = Color(0xFF059669); // Emerald 600

  // Neutral Colors - Modern Grays
  static const Color background = Color(0xFFFAFAFA); // Gray 50
  static const Color surface = Color(0xFFFFFFFF); // White
  static const Color surfaceVariant = Color(0xFFF5F5F5); // Gray 100
  
  // Text Colors
  static const Color textPrimary = Color(0xFF111827); // Gray 900
  static const Color textSecondary = Color(0xFF6B7280); // Gray 500
  static const Color textTertiary = Color(0xFF9CA3AF); // Gray 400
  static const Color textOnPrimary = Color(0xFFFFFFFF); // White
  static const Color textOnSecondary = Color(0xFFFFFFFF); // White

  // Status Colors
  static const Color success = Color(0xFF10B981); // Emerald 500
  static const Color successLight = Color(0xFFD1FAE5); // Emerald 100
  static const Color warning = Color(0xFFF59E0B); // Amber 500
  static const Color warningLight = Color(0xFFFEF3C7); // Amber 100
  static const Color error = Color(0xFFEF4444); // Red 500
  static const Color errorLight = Color(0xFFFEE2E2); // Red 100
  static const Color info = Color(0xFF3B82F6); // Blue 500
  static const Color infoLight = Color(0xFFDBEAFE); // Blue 100

  // Border Colors
  static const Color border = Color(0xFFE5E7EB); // Gray 200
  static const Color borderLight = Color(0xFFF3F4F6); // Gray 100
  static const Color borderDark = Color(0xFFD1D5DB); // Gray 300

  // Shadow Colors
  static const Color shadow = Color(0x1A000000); // Black with 10% opacity
  static const Color shadowLight = Color(0x0D000000); // Black with 5% opacity
  static const Color shadowDark = Color(0x33000000); // Black with 20% opacity

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryLight],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary, secondaryLight],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [background, surface],
  );

  // Card Colors
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color cardShadow = Color(0x0A000000); // Black with 4% opacity

  // Button Colors
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = secondary;
  static const Color buttonDisabled = Color(0xFFE5E7EB); // Gray 200
  static const Color buttonTextDisabled = Color(0xFF9CA3AF); // Gray 400

  // Input Field Colors
  static const Color inputBackground = Color(0xFFFFFFFF);
  static const Color inputBorder = border;
  static const Color inputBorderFocused = primary;
  static const Color inputBorderError = error;
  static const Color inputText = textPrimary;
  static const Color inputHint = textTertiary;

  // Rating Colors
  static const Color ratingFilled = Color(0xFFFBBF24); // Amber 400
  static const Color ratingEmpty = Color(0xFFE5E7EB); // Gray 200

  // Cart Badge Colors
  static const Color cartBadge = error;
  static const Color cartBadgeText = textOnPrimary;

  // Price Colors
  static const Color priceOriginal = textSecondary;
  static const Color priceDiscounted = error;
  static const Color priceSale = success;

  // Category Colors (for different product categories)
  static const List<Color> categoryColors = [
    Color(0xFF6366F1), // Indigo
    Color(0xFF8B5CF6), // Violet
    Color(0xFFEC4899), // Pink
    Color(0xFFEF4444), // Red
    Color(0xFFF59E0B), // Amber
    Color(0xFF10B981), // Emerald
    Color(0xFF06B6D4), // Cyan
    Color(0xFF3B82F6), // Blue
  ];

  /// Get category color by index
  static Color getCategoryColor(int index) {
    return categoryColors[index % categoryColors.length];
  }

  /// Get color with opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withValues(alpha: opacity);
  }

  /// Get material color swatch for primary color
  static MaterialColor get primarySwatch {
    return MaterialColor(
      primary.toARGB32(),
      const <int, Color>{
        50: Color(0xFFEEF2FF), // Indigo 50
        100: Color(0xFFE0E7FF), // Indigo 100
        200: Color(0xFFC7D2FE), // Indigo 200
        300: Color(0xFFA5B4FC), // Indigo 300
        400: Color(0xFF818CF8), // Indigo 400
        500: Color(0xFF6366F1), // Indigo 500
        600: Color(0xFF4F46E5), // Indigo 600
        700: Color(0xFF4338CA), // Indigo 700
        800: Color(0xFF3730A3), // Indigo 800
        900: Color(0xFF312E81), // Indigo 900
      },
    );
  }
}
