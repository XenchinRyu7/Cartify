import '../entities/cart.dart';

/// Repository interface for cart operations
/// Defines the contract for cart data access
abstract class CartRepository {
  /// Get current cart
  Future<Cart> getCart();

  /// Add product to cart
  Future<Cart> addToCart(String productId, int quantity);

  /// Remove product from cart
  Future<Cart> removeFromCart(String productId);

  /// Update product quantity in cart
  Future<Cart> updateCartItemQuantity(String productId, int quantity);

  /// Clear entire cart
  Future<Cart> clearCart();

  /// Get cart item count
  Future<int> getCartItemCount();

  /// Check if product is in cart
  Future<bool> isProductInCart(String productId);

  /// Get cart item by product ID
  Future<CartItem?> getCartItem(String productId);
}
