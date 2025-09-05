import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'marine_vehicle_sale_categories_screen.dart';
import 'marine_vehicle_rental_categories_screen.dart';

class MarineVehicleCategoriesScreen extends StatelessWidget {
  const MarineVehicleCategoriesScreen({super.key});

  final List<String> _categories = const [
    'Satılık Deniz Araçları',
    'Kiralık Deniz Araçları',
  ];

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
              'Araba > Deniz Araçları',
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
                  Icons.directions_boat,
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
                if (_categories[index] == 'Satılık Deniz Araçları') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MarineVehicleSaleCategoriesScreen(),
                    ),
                  );
                } else if (_categories[index] == 'Kiralık Deniz Araçları') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MarineVehicleRentalCategoriesScreen(),
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
