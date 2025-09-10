import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/product.dart';

part 'product_model.g.dart';

/// Data model for Product entity
/// Handles JSON serialization/deserialization
@JsonSerializable()
class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.imageUrl,
    required super.category,
    required super.rating,
    required super.reviewCount,
    required super.isAvailable,
    super.imageUrls = const [],
    super.specifications = const {},
  });

  /// Create ProductModel from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  /// Convert ProductModel to JSON
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  /// Create ProductModel from Product entity
  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      category: product.category,
      rating: product.rating,
      reviewCount: product.reviewCount,
      isAvailable: product.isAvailable,
      imageUrls: product.imageUrls,
      specifications: product.specifications,
    );
  }

  /// Convert ProductModel to Product entity
  Product toEntity() {
    return Product(
      id: id,
      name: name,
      description: description,
      price: price,
      imageUrl: imageUrl,
      category: category,
      rating: rating,
      reviewCount: reviewCount,
      isAvailable: isAvailable,
      imageUrls: imageUrls,
      specifications: specifications,
    );
  }
}
