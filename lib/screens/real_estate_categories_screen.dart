import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'housing_categories_screen.dart';
import 'workplace_categories_screen.dart';
import 'land_categories_screen.dart';
import 'housing_projects_screen.dart';
import 'building_categories_screen.dart';
import 'timeshare_categories_screen.dart';
import 'tourist_facility_categories_screen.dart';

class RealEstateCategoriesScreen extends StatelessWidget {
  const RealEstateCategoriesScreen({super.key});

  final List<String> _realEstateSubcategories = const [
    'Konut',
    'Arsa',
    'İş Yeri',
    'Konut Projeleri',
    'Bina',
    'Devre Mülk',
    'Turistik Tesis',
  ];

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Konut':
        return Icons.home;
      case 'Arsa':
        return Icons.landscape;
      case 'İş Yeri':
        return Icons.business;
      case 'Konut Projeleri':
        return Icons.apartment;
      case 'Bina':
        return Icons.location_city;
      case 'Devre Mülk':
        return Icons.holiday_village;
      case 'Turistik Tesis':
        return Icons.hotel;
      default:
        return Icons.home_work;
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
              'Emlak',
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
        itemCount: _realEstateSubcategories.length,
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
                  _getIconForCategory(_realEstateSubcategories[index]),
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
              title: Text(
                _realEstateSubcategories[index],
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
                switch (_realEstateSubcategories[index]) {
                  case 'Konut':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HousingCategoriesScreen(),
                      ),
                    );
                    break;
                  case 'İş Yeri':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WorkplaceCategoriesScreen(),
                      ),
                    );
                    break;
                  case 'Arsa':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LandCategoriesScreen(),
                      ),
                    );
                    break;
                  case 'Konut Projeleri':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HousingProjectsScreen(),
                      ),
                    );
                    break;
                  case 'Bina':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BuildingCategoriesScreen(),
                      ),
                    );
                    break;
                  case 'Devre Mülk':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TimeshareCategoriesScreen(),
                      ),
                    );
                    break;
                  case 'Turistik Tesis':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TouristFacilityCategoriesScreen(),
                      ),
                    );
                    break;
                }
              },
            ),
          );
        },
      ),
    );
  }
}
