import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'damaged_car_brands_screen.dart';
import 'damaged_motorcycle_brands_screen.dart';
import 'damaged_commercial_vehicle_categories_screen.dart';

class DamagedVehicleCategoriesScreen extends StatelessWidget {
  const DamagedVehicleCategoriesScreen({super.key});

  final List<String> _categories = const [
    'Hasarlı Otomobil',
    'Hasarlı Motosiklet',
    'Hasarlı Ticari Araçlar',
  ];

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Hasarlı Otomobil':
        return Icons.directions_car;
      case 'Hasarlı Motosiklet':
        return Icons.motorcycle;
      case 'Hasarlı Ticari Araçlar':
        return Icons.local_shipping;
      default:
        return Icons.car_crash;
    }
  }

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
              'Araba > Hasarlı Araçlar',
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
      body: ListView.builder(
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.divider,
                  width: 1,
                ),
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getIconForCategory(_categories[index]),
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
              title: Text(
                _categories[index],
                style: const TextStyle(
                  fontSize: 17,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: AppColors.textSecondary,
                size: 26,
              ),
              onTap: () {
                if (_categories[index] == 'Hasarlı Otomobil') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DamagedCarBrandsScreen(),
                    ),
                  );
                } else if (_categories[index] == 'Hasarlı Motosiklet') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DamagedMotorcycleBrandsScreen(),
                    ),
                  );
                } else if (_categories[index] == 'Hasarlı Ticari Araçlar') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DamagedCommercialVehicleCategoriesScreen(),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
