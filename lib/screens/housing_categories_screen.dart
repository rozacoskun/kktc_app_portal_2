import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'housing_sale_categories_screen.dart';
import 'housing_rent_categories_screen.dart';
import 'housing_daily_rent_categories_screen.dart';
import 'housing_transfer_sale_categories_screen.dart';

class HousingCategoriesScreen extends StatelessWidget {
  const HousingCategoriesScreen({super.key});

  final List<String> _housingSubcategories = const [
    'Satılık Konut',
    'Kiralık Konut',
    'Turistik Kiralık Konut',
    'Günlük Kiralık Konut',
    'Devren Satılık Konut',
  ];

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Satılık Konut':
        return Icons.sell;
      case 'Kiralık Konut':
        return Icons.key;
      case 'Turistik Kiralık Konut':
        return Icons.beach_access;
      case 'Günlük Kiralık Konut':
        return Icons.calendar_today;
      case 'Devren Satılık Konut':
        return Icons.swap_horiz;
      default:
        return Icons.home;
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
              'Emlak > Konut',
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
        itemCount: _housingSubcategories.length,
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
                  _getIconForCategory(_housingSubcategories[index]),
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
              title: Text(
                _housingSubcategories[index],
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
                switch (_housingSubcategories[index]) {
                  case 'Satılık Konut':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HousingSaleCategoriesScreen(),
                      ),
                    );
                    break;
                  case 'Kiralık Konut':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HousingRentCategoriesScreen(),
                      ),
                    );
                    break;
                  case 'Turistik Kiralık Konut':
                  case 'Günlük Kiralık Konut':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HousingDailyRentCategoriesScreen(),
                      ),
                    );
                    break;
                  case 'Devren Satılık Konut':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HousingTransferSaleCategoriesScreen(),
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
