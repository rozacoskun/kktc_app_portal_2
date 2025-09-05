import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'tourist_facility_sale_categories_screen.dart';
import 'tourist_facility_rent_categories_screen.dart';

class TouristFacilityCategoriesScreen extends StatelessWidget {
  const TouristFacilityCategoriesScreen({super.key});

  final List<String> _touristFacilitySubcategories = const [
    'Satılık Turistik Tesis',
    'Kiralık Turistik Tesis',
  ];

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Satılık Turistik Tesis':
        return Icons.sell;
      case 'Kiralık Turistik Tesis':
        return Icons.vpn_key;
      default:
        return Icons.hotel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Turistik Tesis Kategorileri',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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
        itemCount: _touristFacilitySubcategories.length,
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
                  _getIconForCategory(_touristFacilitySubcategories[index]),
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
              title: Text(
                _touristFacilitySubcategories[index],
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
                if (_touristFacilitySubcategories[index] == 'Satılık Turistik Tesis') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TouristFacilitySaleCategoriesScreen(),
                    ),
                  );
                } else if (_touristFacilitySubcategories[index] == 'Kiralık Turistik Tesis') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TouristFacilityRentCategoriesScreen(),
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
