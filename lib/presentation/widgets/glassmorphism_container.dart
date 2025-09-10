import 'package:flutter/material.dart';
import 'dart:ui';
import '../../../core/theme/app_colors.dart';

/// Glassmorphism container widget for futuristic UI effects
/// Provides transparent background with blur and border effects
class GlassmorphismContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final double blurRadius;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;

  const GlassmorphismContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.blurRadius = 10.0,
    this.boxShadow,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(20),
        gradient: gradient,
        color: backgroundColor ?? AppColors.glassBackground,
        border: Border.all(
          color: borderColor ?? AppColors.glassBorder,
          width: borderWidth,
        ),
        boxShadow: boxShadow ?? [
          BoxShadow(
            color: AppColors.glassShadow,
            blurRadius: blurRadius,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurRadius, sigmaY: blurRadius),
          child: Container(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}

/// Glassmorphism card widget specifically for product cards
class GlassmorphismCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final double elevation;

  const GlassmorphismCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.onTap,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius ?? BorderRadius.circular(20),
          child: GlassmorphismContainer(
            padding: padding ?? const EdgeInsets.all(16),
            borderRadius: borderRadius ?? BorderRadius.circular(20),
            backgroundColor: AppColors.glassBackground,
            borderColor: AppColors.glassBorder,
            blurRadius: 15.0,
            boxShadow: [
              BoxShadow(
                color: AppColors.glassShadow,
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 0),
              ),
            ],
            child: child,
          ),
        ),
      ),
    );
  }
}

/// Glassmorphism button with neon gradient
class GlassmorphismButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Gradient? gradient;
  final bool isEnabled;

  const GlassmorphismButton({
    super.key,
    required this.child,
    this.onPressed,
    this.padding,
    this.borderRadius,
    this.gradient,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? onPressed : null,
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        child: GlassmorphismContainer(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          backgroundColor: isEnabled 
              ? AppColors.glassBackground 
              : AppColors.glassBackground.withValues(alpha: 0.3),
          borderColor: isEnabled 
              ? AppColors.primary 
              : AppColors.glassBorder,
          borderWidth: isEnabled ? 2.0 : 1.0,
          gradient: isEnabled ? gradient : null,
          blurRadius: 10.0,
          boxShadow: isEnabled ? [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.3),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ] : null,
          child: child,
        ),
      ),
    );
  }
}

/// Glassmorphism bottom navigation bar
class GlassmorphismBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;
  final List<BottomNavigationBarItem> items;

  const GlassmorphismBottomNavBar({
    super.key,
    required this.currentIndex,
    this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.glassBackground,
            AppColors.glassBackground.withValues(alpha: 0.8),
          ],
        ),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.textTertiary,
            elevation: 0,
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            items: items,
          ),
        ),
      ),
    );
  }
}
