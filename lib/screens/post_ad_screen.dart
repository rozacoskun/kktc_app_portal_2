import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'car_categories_screen.dart';
import 'real_estate_categories_screen.dart';
import 'electronics_categories_screen.dart';
import 'electronics_details_screen.dart';

class PostAdScreen extends StatefulWidget {
  const PostAdScreen({super.key});

  @override
  State<PostAdScreen> createState() => _PostAdScreenState();
}

class _PostAdScreenState extends State<PostAdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'İlan Ver',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Kategori Seçin',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ne satmak istersiniz?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 24),
              // Araba Kategorisi
              _buildCategoryCard(
                title: 'Araba',
                description: 'Otomobil, SUV, Motosiklet ve daha fazlası...',
                icon: Icons.directions_car,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CarCategoriesScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              // Emlak Kategorisi
              _buildCategoryCard(
                title: 'Emlak',
                description: 'Konut, İş Yeri, Arsa ve daha fazlası...',
                icon: Icons.home_work,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RealEstateCategoriesScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              // Elektronik Kategorisi
              _buildCategoryCard(
                title: 'Elektronik',
                description: 'Telefon, Bilgisayar, Tablet ve daha fazlası...',
                icon: Icons.devices,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ElectronicsCategoriesScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              // 2. El Eşya Kategorisi
              _buildCategoryCard(
                title: '2. El Eşya',
                description: 'Mobilya, Beyaz Eşya, Ev Tekstili ve daha fazlası...',
                icon: Icons.chair,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ElectronicsDetailsScreen(
                        category: '2. El Eşya',
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              // İş İlanı Kategorisi
              _buildCategoryCard(
                title: 'İş İlanı',
                description: 'İş Arayan, Eleman Arayan ve daha fazlası...',
                icon: Icons.work,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ElectronicsDetailsScreen(
                        category: 'İş İlanı',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.primary,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textPrimary.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.textPrimary.withOpacity(0.3),
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}