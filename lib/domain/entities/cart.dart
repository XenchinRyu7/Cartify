import 'package:equatable/equatable.dart';
import 'product.dart';

/// Cart item entity representing an item in the shopping cart
class CartItem extends Equatable {
  final String id;
  final Product product;
  final int quantity;
  final DateTime addedAt;

  const CartItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.addedAt,
  });

  /// Create a copy of this cart item with updated fields
  CartItem copyWith({
    String? id,
    Product? product,
    int? quantity,
    DateTime? addedAt,
  }) {
    return CartItem(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  /// Get total price for this cart item (product price * quantity)
  double get totalPrice => product.price * quantity;

  /// Get formatted total price with currency symbol
  String get formattedTotalPrice => '\$${totalPrice.toStringAsFixed(2)}';

  @override
  List<Object?> get props => [id, product, quantity, addedAt];

  @override
  String toString() {
    return 'CartItem(id: $id, product: ${product.name}, quantity: $quantity, total: $formattedTotalPrice)';
  }
}

/// Cart entity representing the shopping cart
class Cart extends Equatable {
  final String id;
  final List<CartItem> items;
  final DateTime lastUpdated;

  const Cart({
    required this.id,
    required this.items,
    required this.lastUpdated,
  });

  /// Create a copy of this cart with updated fields
  Cart copyWith({
    String? id,
    List<CartItem>? items,
    DateTime? lastUpdated,
  }) {
    return Cart(
      id: id ?? this.id,
      items: items ?? this.items,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  /// Get total number of items in cart
  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);

  /// Get total price of all items in cart
  double get totalPrice => items.fold(0.0, (sum, item) => sum + item.totalPrice);

  /// Get formatted total price with currency symbol
  String get formattedTotalPrice => '\$${totalPrice.toStringAsFixed(2)}';

  /// Check if cart is empty
  bool get isEmpty => items.isEmpty;

  /// Check if cart has items
  bool get isNotEmpty => items.isNotEmpty;

  /// Get cart item by product id
  CartItem? getItemByProductId(String productId) {
    try {
      return items.firstWhere((item) => item.product.id == productId);
    } catch (e) {
      return null;
    }
  }

  /// Check if product exists in cart
  bool hasProduct(String productId) {
    return items.any((item) => item.product.id == productId);
  }

  @override
  List<Object?> get props => [id, items, lastUpdated];

  @override
  String toString() {
    return 'Cart(id: $id, items: ${items.length}, totalItems: $totalItems, totalPrice: $formattedTotalPrice)';
  }
}
