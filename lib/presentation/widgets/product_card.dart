import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../screens/product_detail/product_detail_screen.dart';
import 'glassmorphism_container.dart';

/// Futuristic product card widget with glassmorphism and neon effects
/// Used in product grids and lists throughout the app
class ProductCard extends StatelessWidget {
  final String id;
  final String name;
  final double price;
  final double? originalPrice;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final bool isOnSale;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    this.originalPrice,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.isOnSale,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphismCard(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              productId: id,
              productName: name,
              price: price,
              originalPrice: originalPrice,
              imageUrl: imageUrl,
              rating: rating,
              reviewCount: reviewCount,
              isOnSale: isOnSale,
            ),
          ),
        );
      },
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Product Image with Neon Border
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary.withValues(alpha: 0.2),
                  AppColors.secondary.withValues(alpha: 0.2),
                ],
              ),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.5),
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  // Product Image
                  CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: (context, url) => Container(
                      color: AppColors.surface,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: AppColors.surface,
                      child: const Icon(
                        Icons.image_not_supported,
                        color: AppColors.textSecondary,
                        size: 40,
                      ),
                    ),
                  ),
                  
                  // Sale Badge with Neon Effect
                  if (isOnSale)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.accent, AppColors.accentLight],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.accent.withValues(alpha: 0.5),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          'SALE',
                          style: AppTheme.labelSmall.copyWith(
                            color: AppColors.textOnPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Product Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Product Name with Glow Effect
              Text(
                name,
                style: AppTheme.productTitle.copyWith(
                  color: AppColors.textPrimary,
                  shadows: [
                    Shadow(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              const SizedBox(height: 6),
              
              // Rating Row
              Row(
                children: [
                  // Star Rating with Neon Effect
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.warning.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.warning.withValues(alpha: 0.5),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.warning,
                          size: 12,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          rating.toStringAsFixed(1),
                          style: AppTheme.productRating.copyWith(
                            color: AppColors.warning,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(width: 6),
                  
                  // Review Count
                  Text(
                    '($reviewCount)',
                    style: AppTheme.productRating.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 8),
              
              // Price Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Price with Neon Glow
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: AppTheme.productPrice.copyWith(
                          shadows: [
                            Shadow(
                              color: AppColors.primary.withValues(alpha: 0.5),
                              blurRadius: 8,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                      if (originalPrice != null)
                        Text(
                          '\$${originalPrice!.toStringAsFixed(2)}',
                          style: AppTheme.productPriceOriginal,
                        ),
                    ],
                  ),
                  
                  // Add to Cart Button with Neon Effect
                  GestureDetector(
                    onTap: onAddToCart,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.primary, AppColors.primaryLight],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.4),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.add_shopping_cart,
                        color: AppColors.textOnPrimary,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}