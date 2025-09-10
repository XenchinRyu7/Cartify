/// Application constants for Cartify e-commerce app
class AppConstants {
  // App Information
  static const String appName = 'Cartify';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Modern e-commerce mobile application';

  // API Configuration
  static const String baseUrl = 'https://api.cartify.com';
  static const String apiVersion = 'v1';
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Database Configuration
  static const String databaseName = 'cartify.db';
  static const int databaseVersion = 1;

  // Storage Keys
  static const String userTokenKey = 'user_token';
  static const String userDataKey = 'user_data';
  static const String cartDataKey = 'cart_data';
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language';

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Image Configuration
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const List<String> allowedImageFormats = ['jpg', 'jpeg', 'png', 'webp'];
  static const String defaultImageUrl = 'https://via.placeholder.com/300x300?text=No+Image';

  // Cart Configuration
  static const int maxCartItems = 100;
  static const int maxQuantityPerItem = 99;

  // Rating Configuration
  static const double minRating = 0.0;
  static const double maxRating = 5.0;
  static const int maxReviewLength = 1000;

  // Search Configuration
  static const int minSearchLength = 2;
  static const int maxSearchLength = 100;
  static const Duration searchDebounceDelay = Duration(milliseconds: 500);

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // UI Configuration
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double defaultBorderRadius = 12.0;
  static const double smallBorderRadius = 8.0;
  static const double largeBorderRadius = 16.0;

  // Product Categories
  static const List<String> productCategories = [
    'Electronics',
    'Clothing',
    'Home & Garden',
    'Sports',
    'Books',
    'Beauty',
    'Toys',
    'Automotive',
    'Health',
    'Food',
  ];

  // Currency Configuration
  static const String defaultCurrency = 'USD';
  static const String currencySymbol = '\$';
  static const int currencyDecimalPlaces = 2;

  // Error Messages
  static const String networkErrorMessage = 'Network connection error. Please check your internet connection.';
  static const String serverErrorMessage = 'Server error. Please try again later.';
  static const String unknownErrorMessage = 'An unknown error occurred. Please try again.';
  static const String timeoutErrorMessage = 'Request timeout. Please try again.';

  // Success Messages
  static const String addToCartSuccessMessage = 'Product added to cart successfully!';
  static const String removeFromCartSuccessMessage = 'Product removed from cart successfully!';
  static const String updateCartSuccessMessage = 'Cart updated successfully!';
  static const String orderPlacedSuccessMessage = 'Order placed successfully!';

  // Validation Messages
  static const String emailRequiredMessage = 'Email is required';
  static const String emailInvalidMessage = 'Please enter a valid email address';
  static const String passwordRequiredMessage = 'Password is required';
  static const String passwordMinLengthMessage = 'Password must be at least 8 characters';
  static const String nameRequiredMessage = 'Name is required';
  static const String phoneRequiredMessage = 'Phone number is required';
  static const String addressRequiredMessage = 'Address is required';

  // Social Media Links
  static const String facebookUrl = 'https://facebook.com/cartify';
  static const String twitterUrl = 'https://twitter.com/cartify';
  static const String instagramUrl = 'https://instagram.com/cartify';
  static const String linkedinUrl = 'https://linkedin.com/company/cartify';

  // Support Information
  static const String supportEmail = 'support@cartify.com';
  static const String supportPhone = '+1 (555) 123-4567';
  static const String supportWebsite = 'https://help.cartify.com';

  // Privacy & Terms
  static const String privacyPolicyUrl = 'https://cartify.com/privacy';
  static const String termsOfServiceUrl = 'https://cartify.com/terms';
  static const String refundPolicyUrl = 'https://cartify.com/refund';

  // Feature Flags
  static const bool enableDarkMode = true;
  static const bool enableNotifications = true;
  static const bool enableBiometricAuth = true;
  static const bool enableOfflineMode = true;
  static const bool enableWishlist = true;
  static const bool enableReviews = true;
  static const bool enableRecommendations = true;

  // Cache Configuration
  static const Duration cacheExpiration = Duration(hours: 24);
  static const int maxCacheSize = 100 * 1024 * 1024; // 100MB

  // Analytics Events
  static const String productViewedEvent = 'product_viewed';
  static const String productAddedToCartEvent = 'product_added_to_cart';
  static const String productRemovedFromCartEvent = 'product_removed_from_cart';
  static const String cartViewedEvent = 'cart_viewed';
  static const String checkoutStartedEvent = 'checkout_started';
  static const String orderCompletedEvent = 'order_completed';
  static const String searchPerformedEvent = 'search_performed';
  static const String categoryViewedEvent = 'category_viewed';
}
