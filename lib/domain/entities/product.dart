import 'package:equatable/equatable.dart';

/// Product entity representing a product in the e-commerce app
/// This is the core business object that contains all product information
class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final double rating;
  final int reviewCount;
  final bool isAvailable;
  final List<String> imageUrls;
  final Map<String, dynamic> specifications;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.isAvailable,
    this.imageUrls = const [],
    this.specifications = const {},
  });

  /// Create a copy of this product with updated fields
  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? category,
    double? rating,
    int? reviewCount,
    bool? isAvailable,
    List<String>? imageUrls,
    Map<String, dynamic>? specifications,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isAvailable: isAvailable ?? this.isAvailable,
      imageUrls: imageUrls ?? this.imageUrls,
      specifications: specifications ?? this.specifications,
    );
  }

  /// Get formatted price with currency symbol
  String get formattedPrice => '\$${price.toStringAsFixed(2)}';

  /// Get formatted rating with star display
  String get formattedRating => '${rating.toStringAsFixed(1)} ⭐';

  /// Get formatted review count
  String get formattedReviewCount => '($reviewCount reviews)';

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        imageUrl,
        category,
        rating,
        reviewCount,
        isAvailable,
        imageUrls,
        specifications,
      ];

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $formattedPrice, category: $category)';
  }
}
