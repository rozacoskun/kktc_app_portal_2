import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class HousingRentCategoriesScreen extends StatelessWidget {
  const HousingRentCategoriesScreen({super.key});

  final List<String> _housingRentSubcategories = const [
    'Daire',
    'Rezidans',
    'Müstakil Ev',
    'Villa',
    'Çiftlik Evi',
    'Köşk & Konak',
    'Yalı',
    'Yalı Dairesi',
    'Yazlık',
  ];

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Daire':
        return Icons.apartment;
      case 'Rezidans':
        return Icons.location_city;
      case 'Müstakil Ev':
        return Icons.home;
      case 'Villa':
        return Icons.villa;
      case 'Çiftlik Evi':
        return Icons.holiday_village;
      case 'Köşk & Konak':
        return Icons.castle;
      case 'Yalı':
        return Icons.deck;
      case 'Yalı Dairesi':
        return Icons.balcony;
      case 'Yazlık':
        return Icons.beach_access;
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
              'Emlak > Konut > Kiralık',
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
        itemCount: _housingRentSubcategories.length,
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
                  _getIconForCategory(_housingRentSubcategories[index]),
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
              title: Text(
                _housingRentSubcategories[index],
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
                // TODO: Alt kategori seçildiğinde yapılacak işlemler
              },
            ),
          );
        },
      ),
    );
  }
}
