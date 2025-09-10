import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Orders screen displaying user's order history
/// Shows past and current orders with status tracking
class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  // Mock orders data
  final List<Map<String, dynamic>> _allOrders = [
    {
      'id': 'ORD-001',
      'date': '2024-01-15',
      'status': 'delivered',
      'total': 299.97,
      'items': [
        {'name': 'Wireless Headphones', 'quantity': 1, 'price': 99.99},
        {'name': 'Smart Watch', 'quantity': 1, 'price': 199.99},
      ],
      'trackingNumber': 'TRK123456789',
    },
    {
      'id': 'ORD-002',
      'date': '2024-01-10',
      'status': 'shipped',
      'total': 149.98,
      'items': [
        {'name': 'Cotton T-Shirt', 'quantity': 2, 'price': 24.99},
        {'name': 'Running Shoes', 'quantity': 1, 'price': 99.99},
      ],
      'trackingNumber': 'TRK987654321',
    },
    {
      'id': 'ORD-003',
      'date': '2024-01-05',
      'status': 'processing',
      'total': 79.99,
      'items': [
        {'name': 'Garden Tools Set', 'quantity': 1, 'price': 79.99},
      ],
      'trackingNumber': null,
    },
    {
      'id': 'ORD-004',
      'date': '2023-12-28',
      'status': 'cancelled',
      'total': 199.99,
      'items': [
        {'name': 'Smart Watch', 'quantity': 1, 'price': 199.99},
      ],
      'trackingNumber': null,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _activeOrders {
    return _allOrders.where((order) => 
      order['status'] == 'processing' || order['status'] == 'shipped'
    ).toList();
  }

  List<Map<String, dynamic>> get _deliveredOrders {
    return _allOrders.where((order) => order['status'] == 'delivered').toList();
  }

  List<Map<String, dynamic>> get _cancelledOrders {
    return _allOrders.where((order) => order['status'] == 'cancelled').toList();
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'processing':
        return AppColors.warning;
      case 'shipped':
        return AppColors.info;
      case 'delivered':
        return AppColors.success;
      case 'cancelled':
        return AppColors.error;
      default:
        return AppColors.textSecondary;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'processing':
        return 'Processing';
      case 'shipped':
        return 'Shipped';
      case 'delivered':
        return 'Delivered';
      case 'cancelled':
        return 'Cancelled';
      default:
        return status;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondary,
          indicatorColor: AppColors.primary,
          tabs: [
            Tab(text: 'All (${_allOrders.length})'),
            Tab(text: 'Active (${_activeOrders.length})'),
            Tab(text: 'Delivered (${_deliveredOrders.length})'),
            Tab(text: 'Cancelled (${_cancelledOrders.length})'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrdersList(_allOrders),
          _buildOrdersList(_activeOrders),
          _buildOrdersList(_deliveredOrders),
          _buildOrdersList(_cancelledOrders),
        ],
      ),
    );
  }

  Widget _buildOrdersList(List<Map<String, dynamic>> orders) {
    if (orders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 120,
              color: AppColors.textTertiary,
            ),
            const SizedBox(height: 24),
            Text(
              'No orders found',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Your orders will appear here',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Navigate to home to start shopping
                DefaultTabController.of(context).animateTo(0);
              },
              child: const Text('Start Shopping'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return _buildOrderCard(order);
      },
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shadowColor: AppColors.cardShadow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order ${order['id']}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      order['date'],
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _getStatusColor(order['status']).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _getStatusColor(order['status']).withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    _getStatusText(order['status']),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: _getStatusColor(order['status']),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Order Items
            ...order['items'].map<Widget>((item) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item['name'],
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      '${item['quantity']}x \$${item['price'].toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            
            const SizedBox(height: 16),
            
            // Order Footer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${order['total'].toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                Row(
                  children: [
                    if (order['trackingNumber'] != null)
                      TextButton.icon(
                        onPressed: () {
                          _showTrackingDialog(order['trackingNumber']);
                        },
                        icon: const Icon(Icons.local_shipping, size: 16),
                        label: const Text('Track'),
                      ),
                    const SizedBox(width: 8),
                    if (order['status'] == 'delivered')
                      ElevatedButton(
                        onPressed: () {
                          _showReorderDialog(order);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.textOnPrimary,
                        ),
                        child: const Text('Reorder'),
                      )
                    else if (order['status'] == 'processing')
                      OutlinedButton(
                        onPressed: () {
                          _showCancelDialog(order);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.error,
                          side: const BorderSide(color: AppColors.error),
                        ),
                        child: const Text('Cancel'),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showTrackingDialog(String trackingNumber) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Track Package'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Your package is on its way!'),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Tracking Number: $trackingNumber',
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showReorderDialog(Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reorder Items'),
        content: Text('Add all items from order ${order['id']} to cart?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Items added to cart successfully!'),
                  backgroundColor: AppColors.success,
                ),
              );
            },
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }

  void _showCancelDialog(Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Order'),
        content: Text('Are you sure you want to cancel order ${order['id']}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Order cancelled successfully'),
                  backgroundColor: AppColors.warning,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            child: const Text('Yes, Cancel'),
          ),
        ],
      ),
    );
  }
}
