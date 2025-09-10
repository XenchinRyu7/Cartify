import '../entities/product.dart';

/// Repository interface for product operations
/// Defines the contract for product data access
abstract class ProductRepository {
  /// Get all products with optional pagination
  Future<List<Product>> getProducts({
    int page = 1,
    int limit = 20,
    String? category,
    String? searchQuery,
  });

  /// Get a specific product by ID
  Future<Product> getProductById(String id);

  /// Get products by category
  Future<List<Product>> getProductsByCategory(String category);

  /// Search products by query
  Future<List<Product>> searchProducts(String query);

  /// Get featured products
  Future<List<Product>> getFeaturedProducts();

  /// Get products on sale
  Future<List<Product>> getProductsOnSale();

  /// Get related products for a given product
  Future<List<Product>> getRelatedProducts(String productId);

  /// Get product categories
  Future<List<String>> getCategories();
}
