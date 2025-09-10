import 'package:intl/intl.dart';

/// Utility class for formatting data
/// Provides common formatting methods used throughout the app
class Formatters {
  /// Format currency with proper symbol and decimal places
  static String currency(double amount, {String symbol = '\$'}) {
    final formatter = NumberFormat.currency(
      symbol: symbol,
      decimalDigits: 2,
    );
    return formatter.format(amount);
  }

  /// Format number with thousand separators
  static String number(double number, {int decimalDigits = 0}) {
    final formatter = NumberFormat('#,##0.${'0' * decimalDigits}');
    return formatter.format(number);
  }

  /// Format percentage
  static String percentage(double value, {int decimalDigits = 1}) {
    final formatter = NumberFormat('#,##0.${'0' * decimalDigits}%');
    return formatter.format(value / 100);
  }

  /// Format date in various formats
  static String date(DateTime date, {String pattern = 'MMM dd, yyyy'}) {
    final formatter = DateFormat(pattern);
    return formatter.format(date);
  }

  /// Format time
  static String time(DateTime time, {String pattern = 'HH:mm'}) {
    final formatter = DateFormat(pattern);
    return formatter.format(time);
  }

  /// Format date and time
  static String dateTime(DateTime dateTime, {String pattern = 'MMM dd, yyyy HH:mm'}) {
    final formatter = DateFormat(pattern);
    return formatter.format(dateTime);
  }

  /// Format relative time (e.g., "2 hours ago", "3 days ago")
  static String relativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return '$years year${years == 1 ? '' : 's'} ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '$months month${months == 1 ? '' : 's'} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'Just now';
    }
  }

  /// Format file size in human readable format
  static String fileSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    } else if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    } else {
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
    }
  }

  /// Format phone number
  static String phoneNumber(String phoneNumber) {
    // Remove all non-digit characters
    final digits = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    
    if (digits.length == 10) {
      // Format as (XXX) XXX-XXXX
      return '(${digits.substring(0, 3)}) ${digits.substring(3, 6)}-${digits.substring(6)}';
    } else if (digits.length == 11 && digits.startsWith('1')) {
      // Format as +1 (XXX) XXX-XXXX
      return '+1 (${digits.substring(1, 4)}) ${digits.substring(4, 7)}-${digits.substring(7)}';
    } else {
      // Return original if format is not recognized
      return phoneNumber;
    }
  }

  /// Format credit card number (masked)
  static String creditCard(String cardNumber) {
    final digits = cardNumber.replaceAll(RegExp(r'[^\d]'), '');
    
    if (digits.length >= 4) {
      final lastFour = digits.substring(digits.length - 4);
      final masked = '*' * (digits.length - 4);
      return '$masked$lastFour';
    }
    
    return cardNumber;
  }

  /// Format address
  static String address({
    required String street,
    String? apartment,
    required String city,
    required String state,
    required String zipCode,
    required String country,
  }) {
    final parts = <String>[
      street,
      if (apartment != null && apartment.isNotEmpty) apartment,
      '$city, $state $zipCode',
      country,
    ];
    return parts.join(', ');
  }

  /// Format name (capitalize first letter of each word)
  static String name(String name) {
    return name.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  /// Format initials from full name
  static String initials(String fullName) {
    final words = fullName.trim().split(' ');
    if (words.isEmpty) return '';
    
    if (words.length == 1) {
      return words[0][0].toUpperCase();
    }
    
    return '${words[0][0]}${words[1][0]}'.toUpperCase();
  }

  /// Format rating with stars
  static String rating(double rating, {int maxRating = 5}) {
    final fullStars = rating.floor();
    final hasHalfStar = rating - fullStars >= 0.5;
    final emptyStars = maxRating - fullStars - (hasHalfStar ? 1 : 0);
    
    final stars = '★' * fullStars + 
                 (hasHalfStar ? '☆' : '') + 
                 '☆' * emptyStars;
    
    return '$stars ${rating.toStringAsFixed(1)}';
  }

  /// Format review count
  static String reviewCount(int count) {
    if (count == 0) return 'No reviews';
    if (count == 1) return '1 review';
    if (count < 1000) return '$count reviews';
    if (count < 1000000) return '${(count / 1000).toStringAsFixed(1)}K reviews';
    return '${(count / 1000000).toStringAsFixed(1)}M reviews';
  }

  /// Format quantity
  static String quantity(int quantity, {String? unit}) {
    if (unit != null) {
      return '$quantity $unit${quantity == 1 ? '' : 's'}';
    }
    return quantity.toString();
  }

  /// Format discount percentage
  static String discount(double originalPrice, double salePrice) {
    final discount = ((originalPrice - salePrice) / originalPrice) * 100;
    return '${discount.toStringAsFixed(0)}% OFF';
  }

  /// Format order status
  static String orderStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return 'Pending';
      case 'processing':
        return 'Processing';
      case 'shipped':
        return 'Shipped';
      case 'delivered':
        return 'Delivered';
      case 'cancelled':
        return 'Cancelled';
      case 'refunded':
        return 'Refunded';
      default:
        return status;
    }
  }

  /// Format tracking number
  static String trackingNumber(String trackingNumber) {
    // Add spaces every 4 characters for better readability
    return trackingNumber.replaceAllMapped(
      RegExp(r'.{4}'),
      (match) => '${match.group(0)} ',
    ).trim();
  }
}
