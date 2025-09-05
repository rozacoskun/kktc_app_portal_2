import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CommercialVehicleCategoriesScreen extends StatelessWidget {
  const CommercialVehicleCategoriesScreen({super.key});

  final List<String> _categories = const [
    'Minibüs',
    'Otobüs',
    'Kamyon & Kamyonet',
    'Çekici',
    'Dorse',
    'Römork',
    'Karoser',
    'Oto Kurtarıcı & Taşıyıcı',
  ];

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Minibüs':
        return Icons.directions_bus;
      case 'Otobüs':
        return Icons.directions_bus_filled;
      case 'Kamyon & Kamyonet':
        return Icons.local_shipping;
      case 'Çekici':
        return Icons.fire_truck;
      case 'Dorse':
        return Icons.local_shipping;
      case 'Römork':
        return Icons.fire_truck;
      case 'Karoser':
        return Icons.local_shipping;
      case 'Oto Kurtarıcı & Taşıyıcı':
        return Icons.fire_truck;
      default:
        return Icons.local_shipping;
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
              'Araba > Ticari Araç',
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
                // TODO: Navigate to brands screen
              },
            ),
          );
        },
      ),
    );
  }
}
