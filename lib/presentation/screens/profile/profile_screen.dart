import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Profile screen displaying user information and account settings
/// Shows user details, order history, settings, and account management
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // Profile Header
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: AppColors.primary,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Profile',
                style: TextStyle(
                  color: AppColors.textOnPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.primary, AppColors.primaryLight],
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.textOnPrimary,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'John Doe',
                        style: TextStyle(
                          color: AppColors.textOnPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'john.doe@example.com',
                        style: TextStyle(
                          color: AppColors.textOnPrimary,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // Profile Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Account Section
                  _buildSection(
                    context,
                    'Account',
                    [
                      _buildMenuItem(
                        context,
                        Icons.person_outline,
                        'Personal Information',
                        'Update your profile details',
                        () => _showComingSoon(context, 'Personal Information'),
                      ),
                      _buildMenuItem(
                        context,
                        Icons.location_on_outlined,
                        'Addresses',
                        'Manage your shipping addresses',
                        () => _showComingSoon(context, 'Addresses'),
                      ),
                      _buildMenuItem(
                        context,
                        Icons.payment_outlined,
                        'Payment Methods',
                        'Manage your payment options',
                        () => _showComingSoon(context, 'Payment Methods'),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Orders Section
                  _buildSection(
                    context,
                    'Orders',
                    [
                      _buildMenuItem(
                        context,
                        Icons.receipt_outlined,
                        'Order History',
                        'View your past orders',
                        () => _showComingSoon(context, 'Order History'),
                      ),
                      _buildMenuItem(
                        context,
                        Icons.local_shipping_outlined,
                        'Track Orders',
                        'Track your current orders',
                        () => _showComingSoon(context, 'Track Orders'),
                      ),
                      _buildMenuItem(
                        context,
                        Icons.rate_review_outlined,
                        'Reviews & Ratings',
                        'Rate your purchases',
                        () => _showComingSoon(context, 'Reviews & Ratings'),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Support Section
                  _buildSection(
                    context,
                    'Support',
                    [
                      _buildMenuItem(
                        context,
                        Icons.help_outline,
                        'Help Center',
                        'Get help and support',
                        () => _showComingSoon(context, 'Help Center'),
                      ),
                      _buildMenuItem(
                        context,
                        Icons.chat_outlined,
                        'Contact Us',
                        'Get in touch with us',
                        () => _showComingSoon(context, 'Contact Us'),
                      ),
                      _buildMenuItem(
                        context,
                        Icons.info_outline,
                        'About',
                        'App version and information',
                        () => _showAboutDialog(context),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Settings Section
                  _buildSection(
                    context,
                    'Settings',
                    [
                      _buildMenuItem(
                        context,
                        Icons.notifications_outlined,
                        'Notifications',
                        'Manage your notifications',
                        () => _showComingSoon(context, 'Notifications'),
                      ),
                      _buildMenuItem(
                        context,
                        Icons.dark_mode_outlined,
                        'Dark Mode',
                        'Switch to dark theme',
                        () => _showComingSoon(context, 'Dark Mode'),
                      ),
                      _buildMenuItem(
                        context,
                        Icons.language_outlined,
                        'Language',
                        'Change app language',
                        () => _showComingSoon(context, 'Language'),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () => _showLogoutDialog(context),
                      icon: const Icon(Icons.logout),
                      label: const Text('Logout'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.error,
                        side: const BorderSide(color: AppColors.error),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: AppColors.primary,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: AppColors.textTertiary,
      ),
      onTap: onTap,
    );
  }

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature - Coming Soon!'),
        backgroundColor: AppColors.info,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Cartify',
      applicationVersion: '1.0.0',
      applicationIcon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.shopping_cart,
          color: AppColors.textOnPrimary,
          size: 32,
        ),
      ),
      children: [
        const Text('A modern e-commerce mobile application built with Flutter.'),
        const SizedBox(height: 16),
        const Text('Features:'),
        const Text('• Clean Architecture'),
        const Text('• Modern UI/UX Design'),
        const Text('• Shopping Cart'),
        const Text('• Order Management'),
        const Text('• User Profile'),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
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
                  content: Text('Logged out successfully'),
                  backgroundColor: AppColors.success,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
