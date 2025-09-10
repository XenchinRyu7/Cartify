import '../entities/product.dart';
import '../repositories/product_repository.dart';

/// Use case for getting products with various filters
/// Implements business logic for product retrieval
class GetProductsUseCase {
  final ProductRepository _repository;

  const GetProductsUseCase(this._repository);

  /// Execute the use case to get products
  Future<List<Product>> call({
    int page = 1,
    int limit = 20,
    String? category,
    String? searchQuery,
  }) async {
    // Validate input parameters
    if (page < 1) {
      throw ArgumentError('Page must be greater than 0');
    }
    
    if (limit < 1 || limit > 100) {
      throw ArgumentError('Limit must be between 1 and 100');
    }

    // Call repository to get products
    return await _repository.getProducts(
      page: page,
      limit: limit,
      category: category,
      searchQuery: searchQuery,
    );
  }
}
