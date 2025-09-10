import '../entities/cart.dart';
import '../repositories/cart_repository.dart';

/// Use case for adding products to cart
/// Implements business logic for cart operations
class AddToCartUseCase {
  final CartRepository _repository;

  const AddToCartUseCase(this._repository);

  /// Execute the use case to add product to cart
  Future<Cart> call(String productId, int quantity) async {
    // Validate input parameters
    if (productId.isEmpty) {
      throw ArgumentError('Product ID cannot be empty');
    }
    
    if (quantity < 1) {
      throw ArgumentError('Quantity must be greater than 0');
    }

    if (quantity > 99) {
      throw ArgumentError('Quantity cannot exceed 99');
    }

    // Check if product is already in cart
    final isInCart = await _repository.isProductInCart(productId);
    
    if (isInCart) {
      // If product exists, update quantity
      final existingItem = await _repository.getCartItem(productId);
      if (existingItem != null) {
        final newQuantity = existingItem.quantity + quantity;
        return await _repository.updateCartItemQuantity(productId, newQuantity);
      }
    }

    // Add new product to cart
    return await _repository.addToCart(productId, quantity);
  }
}
