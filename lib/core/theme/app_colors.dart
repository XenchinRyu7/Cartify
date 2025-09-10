import 'package:flutter/material.dart';

/// Futuristic color palette inspired by crypto/fintech apps
/// Features neon colors, glassmorphism, and cyberpunk aesthetics
class AppColors {
  // Primary Colors - Futuristic Blue
  static const Color primary = Color(0xFF00D4FF); // Electric Blue
  static const Color primaryLight = Color(0xFF40E0D0); // Turquoise
  static const Color primaryDark = Color(0xFF0099CC); // Deep Blue
  static const Color primaryContainer = Color(0xFF001F2E); // Dark Blue

  // Secondary Colors - Neon Cyan
  static const Color secondary = Color(0xFF00E5FF); // Neon Cyan
  static const Color secondaryLight = Color(0xFF67E8F9); // Light Cyan
  static const Color secondaryDark = Color(0xFF00BCD4); // Dark Cyan
  static const Color secondaryContainer = Color(0xFF001F2E); // Dark Blue

  // Accent Colors - Neon Pink
  static const Color accent = Color(0xFFEC4899); // Pink-500
  static const Color accentLight = Color(0xFFF472B6); // Pink-400
  static const Color accentDark = Color(0xFFDB2777); // Pink-600

  // Background Colors - Dark Theme
  static const Color background = Color(0xFF0F0F23); // Deep dark blue
  static const Color surface = Color(0xFF1A1A2E); // Dark surface
  static const Color surfaceVariant = Color(0xFF16213E); // Darker surface
  static const Color outline = Color(0xFF2D3748); // Dark outline
  static const Color outlineVariant = Color(0xFF4A5568); // Lighter outline

  // Text Colors - Light on Dark
  static const Color textPrimary = Color(0xFFF7FAFC); // Almost white
  static const Color textSecondary = Color(0xFFA0AEC0); // Light gray
  static const Color textTertiary = Color(0xFF718096); // Medium gray
  static const Color textOnPrimary = Color(0xFFFFFFFF); // White
  static const Color textOnSecondary = Color(0xFFFFFFFF); // White
  static const Color textOnAccent = Color(0xFFFFFFFF); // White

  // Status Colors - Neon variants
  static const Color success = Color(0xFF00F5FF); // Cyan neon
  static const Color successLight = Color(0xFF67E8F9); // Light cyan
  static const Color successDark = Color(0xFF0891B2); // Dark cyan
  static const Color successContainer = Color(0xFF164E63); // Dark cyan bg

  static const Color warning = Color(0xFFFFD700); // Gold
  static const Color warningLight = Color(0xFFFFF8DC); // Light gold
  static const Color warningDark = Color(0xFFB8860B); // Dark gold
  static const Color warningContainer = Color(0xFF2D1B00); // Dark gold bg

  static const Color error = Color(0xFFFF1744); // Neon red
  static const Color errorLight = Color(0xFFFF6B6B); // Light red
  static const Color errorDark = Color(0xFFD32F2F); // Dark red
  static const Color errorContainer = Color(0xFF2D0000); // Dark red bg

  static const Color info = Color(0xFF00E5FF); // Neon blue
  static const Color infoLight = Color(0xFF40E0D0); // Turquoise
  static const Color infoDark = Color(0xFF0097A7); // Dark teal
  static const Color infoContainer = Color(0xFF001F2E); // Dark blue bg

  // Border Colors
  static const Color border = Color(0xFF2D3748); // Dark border
  static const Color borderLight = Color(0xFF4A5568); // Lighter border
  static const Color borderDark = Color(0xFF1A202C); // Darker border

  // Shadow Colors
  static const Color shadow = Color(0x40000000); // Black with 25% opacity
  static const Color shadowLight = Color(0x1A000000); // Black with 10% opacity
  static const Color shadowDark = Color(0x66000000); // Black with 40% opacity

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryLight, accent],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary, secondaryLight, primary],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accent, accentLight, primary],
  );

  // Aurora-like gradients - Blue focused
  static const LinearGradient auroraGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF00D4FF), // Electric Blue
      Color(0xFF00E5FF), // Neon Cyan
      Color(0xFF40E0D0), // Turquoise
      Color(0xFF00F5FF), // Light cyan
    ],
  );

  static const LinearGradient cyberpunkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1A1A2E), // Dark blue
      Color(0xFF16213E), // Darker blue
      Color(0xFF0F0F23), // Deepest blue
    ],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [background, surface],
  );

  // Card Colors
  static const Color cardBackground = Color(0x1AFFFFFF); // Glass effect
  static const Color cardShadow = Color(0x1A000000); // Black with 10% opacity

  // Button Colors
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = secondary;
  static const Color buttonDisabled = Color(0xFF4A5568); // Dark gray
  static const Color buttonTextDisabled = Color(0xFF718096); // Medium gray

  // Input Field Colors
  static const Color inputBackground = Color(0x1AFFFFFF); // Glass effect
  static const Color inputBorder = border;
  static const Color inputBorderFocused = primary;
  static const Color inputBorderError = error;
  static const Color inputText = textPrimary;
  static const Color inputHint = textTertiary;

  // Rating Colors
  static const Color ratingFilled = Color(0xFFFFD700); // Gold
  static const Color ratingEmpty = Color(0xFF4A5568); // Dark gray

  // Cart Badge Colors
  static const Color cartBadge = error;
  static const Color cartBadgeText = textOnPrimary;

  // Price Colors
  static const Color priceOriginal = textSecondary;
  static const Color priceDiscounted = error;
  static const Color priceSale = success;

  // Category Colors - Blue focused palette
  static const List<Color> categoryColors = [
    Color(0xFF00D4FF), // Electric Blue
    Color(0xFF00E5FF), // Neon Cyan
    Color(0xFF40E0D0), // Turquoise
    Color(0xFF00F5FF), // Light Cyan
    Color(0xFF10B981), // Emerald
    Color(0xFFFFD700), // Gold
    Color(0xFFEC4899), // Neon Pink
    Color(0xFF0099CC), // Deep Blue
  ];

  // Glassmorphism colors
  static const Color glassBackground = Color(0x1AFFFFFF); // White with 10% opacity
  static const Color glassBorder = Color(0x33FFFFFF); // White with 20% opacity
  static const Color glassShadow = Color(0x1A000000); // Black with 10% opacity

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
        50: Color(0xFF1E1B4B), // Violet-900
        100: Color(0xFF1E1B4B), // Violet-900
        200: Color(0xFFA78BFA), // Violet-400
        300: Color(0xFFA78BFA), // Violet-400
        400: Color(0xFFA78BFA), // Violet-400
        500: Color(0xFF8B5CF6), // Violet-500
        600: Color(0xFF7C3AED), // Violet-600
        700: Color(0xFF7C3AED), // Violet-600
        800: Color(0xFF7C3AED), // Violet-600
        900: Color(0xFF7C3AED), // Violet-600
      },
    );
  }
}