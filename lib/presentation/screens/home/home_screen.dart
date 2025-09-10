import 'package:flutter/material.dart';
import 'dart:ui';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../widgets/product_card.dart';
import '../cart/cart_screen.dart';
import 'widgets/category_chip.dart';
import 'widgets/search_bar_widget.dart';

/// Home screen displaying products, categories, and search functionality
/// This is the main screen users see when they open the Cartify app
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  int _cartItemCount = 0;

  // Mock data for demonstration
  final List<String> _categories = [
    'All',
    'Electronics',
    'Clothing',
    'Home & Garden',
    'Sports',
    'Books',
    'Beauty',
    'Toys',
  ];

  final List<Map<String, dynamic>> _products = [
    {
      'id': '1',
      'name': 'Wireless Headphones',
      'price': 99.99,
      'originalPrice': 129.99,
      'imageUrl': 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=300',
      'rating': 4.5,
      'reviewCount': 128,
      'category': 'Electronics',
      'isOnSale': true,
    },
    {
      'id': '2',
      'name': 'Smart Watch',
      'price': 199.99,
      'originalPrice': null,
      'imageUrl': 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=300',
      'rating': 4.8,
      'reviewCount': 89,
      'category': 'Electronics',
      'isOnSale': false,
    },
    {
      'id': '3',
      'name': 'Cotton T-Shirt',
      'price': 24.99,
      'originalPrice': null,
      'imageUrl': 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=300',
      'rating': 4.2,
      'reviewCount': 45,
      'category': 'Clothing',
      'isOnSale': false,
    },
    {
      'id': '4',
      'name': 'Garden Tools Set',
      'price': 79.99,
      'originalPrice': 99.99,
      'imageUrl': 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=300',
      'rating': 4.6,
      'reviewCount': 67,
      'category': 'Home & Garden',
      'isOnSale': true,
    },
    {
      'id': '5',
      'name': 'Running Shoes',
      'price': 129.99,
      'originalPrice': null,
      'imageUrl': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=300',
      'rating': 4.7,
      'reviewCount': 156,
      'category': 'Sports',
      'isOnSale': false,
    },
    {
      'id': '6',
      'name': 'Programming Book',
      'price': 39.99,
      'originalPrice': 49.99,
      'imageUrl': 'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=300',
      'rating': 4.9,
      'reviewCount': 234,
      'category': 'Books',
      'isOnSale': true,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredProducts {
    if (_selectedCategory == 'All') {
      return _products;
    }
    return _products.where((product) => product['category'] == _selectedCategory).toList();
  }

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void _onProductAddedToCart() {
    setState(() {
      _cartItemCount++;
    });
    
    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(AppConstants.addToCartSuccessMessage),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
          appBar: AppBar(
            title: Text(
              AppConstants.appName,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
                shadows: [
                  Shadow(
                    color: AppColors.primary.withValues(alpha: 0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
            ),
            backgroundColor: AppColors.glassBackground,
            foregroundColor: AppColors.textPrimary,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            flexibleSpace: ClipRRect(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.glassBackground,
                      AppColors.glassBackground.withValues(alpha: 0.8),
                    ],
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.glassBorder,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        actions: [
          // Search Icon
          IconButton(
            onPressed: () {
              // TODO: Implement search functionality
            },
            icon: const Icon(Icons.search),
          ),
          // Cart Icon with badge
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              if (_cartItemCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: AppColors.cartBadge,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '$_cartItemCount',
                      style: const TextStyle(
                        color: AppColors.cartBadgeText,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchBarWidget(
              controller: _searchController,
              onChanged: (value) {
                // TODO: Implement search functionality
              },
            ),
          ),
          
          // Categories
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CategoryChip(
                    label: category,
                    isSelected: _selectedCategory == category,
                    onSelected: () => _onCategorySelected(category),
                  ),
                );
              },
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Products Grid
          Expanded(
            child: _filteredProducts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: AppColors.textTertiary,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No products found',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try adjusting your search or category filter',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: _filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = _filteredProducts[index];
                      return ProductCard(
                        id: product['id'],
                        name: product['name'],
                        price: product['price'],
                        originalPrice: product['originalPrice'],
                        imageUrl: product['imageUrl'],
                        rating: product['rating'],
                        reviewCount: product['reviewCount'],
                        isOnSale: product['isOnSale'],
                        onAddToCart: _onProductAddedToCart,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
