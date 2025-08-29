import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ElectricVehicleCategoriesScreen extends StatelessWidget {
  const ElectricVehicleCategoriesScreen({super.key});

  final List<String> _categories = const [
    'Elektrikli Motosiklet',
    'Elektrikli ATV',
    'Elektrikli UTV',
    'Elektrikli Kickscooter',
    'Elektrikli Hizmet Araçları',
  ];

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Elektrikli Motosiklet':
        return Icons.electric_bike;
      case 'Elektrikli ATV':
        return Icons.all_inclusive;
      case 'Elektrikli UTV':
        return Icons.all_inclusive;
      case 'Elektrikli Kickscooter':
        return Icons.electric_scooter;
      case 'Elektrikli Hizmet Araçları':
        return Icons.electric_car;
      default:
        return Icons.electric_car;
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
              'Araba > Elektrikli Araçlar',
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
                // TODO: Navigate to details screen
              },
            ),
          );
        },
      ),
    );
  }
}
