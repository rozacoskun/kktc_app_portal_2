import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'car_years_screen.dart';
import 'motorcycle_brands_screen.dart';
import 'minivan_years_screen.dart';
import 'commercial_vehicle_categories_screen.dart';
import 'rental_vehicle_categories_screen.dart';
import 'marine_vehicle_categories_screen.dart';
import 'damaged_vehicle_categories_screen.dart';
import 'caravan_categories_screen.dart';
import 'car_search_filters_screen.dart';
import 'disabled_vehicle_categories_screen.dart';
import 'electric_vehicle_categories_screen.dart';

class CarCategoriesScreen extends StatelessWidget {
  const CarCategoriesScreen({super.key});

  final List<String> _carSubcategories = const [
    'Otomobil',
    'Arazi, SUV & Pickup',
    'Elektrikli Araçlar',
    'Motosiklet',
    'Minivan & Panelvan',
    'Kiralık Araçlar',
    'Deniz Araçları',
    'Hasarlı Araçlar',
    'Karavan',
    'Klasik Araçlar',
    'Hava Araçları',
    'ATV & UTV',
    'Ticari Araç',
    'Engelli Plakalı Araçlar',
  ];

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Otomobil':
        return Icons.directions_car;
      case 'Arazi, SUV & Pickup':
        return Icons.directions_car_filled;
      case 'Elektrikli Araçlar':
        return Icons.electric_car;
      case 'Motosiklet':
        return Icons.motorcycle;
      case 'Minivan & Panelvan':
        return Icons.airport_shuttle;
      case 'Kiralık Araçlar':
        return Icons.car_rental;
      case 'Deniz Araçları':
        return Icons.directions_boat;
      case 'Hasarlı Araçlar':
        return Icons.car_crash;
      case 'Karavan':
        return Icons.rv_hookup;
      case 'Klasik Araçlar':
        return Icons.time_to_leave;
      case 'Hava Araçları':
        return Icons.flight;
      case 'ATV & UTV':
        return Icons.all_inclusive;
      case 'Ticari Araç':
        return Icons.local_shipping;
      case 'Engelli Plakalı Araçlar':
        return Icons.accessible;
      default:
        return Icons.directions_car;
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
              'Araba',
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
        itemCount: _carSubcategories.length,
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
                  _getIconForCategory(_carSubcategories[index]),
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
              title: Text(
                _carSubcategories[index],
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
                if (_carSubcategories[index] == 'Otomobil' || 
                    _carSubcategories[index] == 'Arazi, SUV & Pickup') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarYearsScreen(
                        category: _carSubcategories[index],
                      ),
                    ),
                  );
                } else if (_carSubcategories[index] == 'Elektrikli Araçlar') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ElectricVehicleCategoriesScreen(),
                    ),
                  );
                } else if (_carSubcategories[index] == 'Motosiklet') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MotorcycleBrandsScreen(),
                    ),
                  );
                } else if (_carSubcategories[index] == 'Minivan & Panelvan') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MinivanYearsScreen(),
                    ),
                  );
                } else if (_carSubcategories[index] == 'Ticari Araç') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CommercialVehicleCategoriesScreen(),
                    ),
                  );
                } else if (_carSubcategories[index] == 'Kiralık Araçlar') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RentalVehicleCategoriesScreen(),
                    ),
                  );
                } else if (_carSubcategories[index] == 'Deniz Araçları') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MarineVehicleCategoriesScreen(),
                    ),
                  );
                } else if (_carSubcategories[index] == 'Hasarlı Araçlar') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DamagedVehicleCategoriesScreen(),
                    ),
                  );
                } else if (_carSubcategories[index] == 'Karavan') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CaravanCategoriesScreen(),
                    ),
                  );
                } else if (_carSubcategories[index] == 'Klasik Araçlar') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarSearchFiltersScreen(
                        category: 'Klasik Araçlar',
                        brand: '',
                        year: DateTime.now().year,
                      ),
                    ),
                  );
                } else if (_carSubcategories[index] == 'Hava Araçları') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarSearchFiltersScreen(
                        category: 'Hava Araçları',
                        brand: '',
                        year: DateTime.now().year,
                      ),
                    ),
                  );
                } else if (_carSubcategories[index] == 'Engelli Plakalı Araçlar') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DisabledVehicleCategoriesScreen(),
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