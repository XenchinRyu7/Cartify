import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Rating widget displaying star ratings with customizable size and color
/// Used throughout the app to show product ratings
class RatingWidget extends StatelessWidget {
  final double rating;
  final double size;
  final Color? filledColor;
  final Color? emptyColor;
  final bool showRatingText;
  final int maxRating;

  const RatingWidget({
    super.key,
    required this.rating,
    this.size = 16,
    this.filledColor,
    this.emptyColor,
    this.showRatingText = false,
    this.maxRating = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Star Icons
        ...List.generate(maxRating, (index) {
          final starRating = index + 1;
          final isFilled = starRating <= rating;
          final isHalfFilled = starRating - 0.5 <= rating && starRating > rating;
          
          return Container(
            margin: const EdgeInsets.only(right: 2),
            child: Icon(
              isFilled
                  ? Icons.star
                  : isHalfFilled
                      ? Icons.star_half
                      : Icons.star_border,
              size: size,
              color: isFilled || isHalfFilled
                  ? (filledColor ?? AppColors.ratingFilled)
                  : (emptyColor ?? AppColors.ratingEmpty),
            ),
          );
        }),
        
        // Rating Text (optional)
        if (showRatingText) ...[
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}
