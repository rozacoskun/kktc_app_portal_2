import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class WorkplaceTransferSaleCategoriesScreen extends StatelessWidget {
  const WorkplaceTransferSaleCategoriesScreen({super.key});

  final List<String> _workplaceTransferSaleSubcategories = const [
    'Apartman Dairesi',
    'Atölye',
    'Büfe',
    'Büro & Ofis',
    'Cafe & Bar',
    'Çiftlik',
    'Depo',
    'Dükkan & Mağaza',
    'Fabrika & Üretim Tesisi',
    'Garaj & Park Yeri',
    'İmalathane',
    'İş Hanı Katı & Ofisi',
    'Kantin',
    'Komple Bina',
    'Oto Yıkama & Kuaför',
    'Pastane, Fırın & Tatlıcı',
    'Plaza',
    'Plaza Katı & Ofisi',
    'Restoran & Lokanta',
    'Rezidans Katı & Ofisi',
    'Sağlık Merkezi',
    'Spor Tesisi',
    'Villa',
    'Yurt',
  ];

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Apartman Dairesi':
        return Icons.apartment;
      case 'Atölye':
        return Icons.construction;
      case 'Büfe':
        return Icons.storefront;
      case 'Büro & Ofis':
        return Icons.business_center;
      case 'Cafe & Bar':
        return Icons.local_cafe;
      case 'Çiftlik':
        return Icons.agriculture;
      case 'Depo':
        return Icons.warehouse;
      case 'Dükkan & Mağaza':
        return Icons.store;
      case 'Fabrika & Üretim Tesisi':
        return Icons.factory;
      case 'Garaj & Park Yeri':
        return Icons.local_parking;
      case 'İmalathane':
        return Icons.precision_manufacturing;
      case 'İş Hanı Katı & Ofisi':
        return Icons.business;
      case 'Kantin':
        return Icons.restaurant;
      case 'Komple Bina':
        return Icons.location_city;
      case 'Oto Yıkama & Kuaför':
        return Icons.local_car_wash;
      case 'Pastane, Fırın & Tatlıcı':
        return Icons.bakery_dining;
      case 'Plaza':
        return Icons.apartment;
      case 'Plaza Katı & Ofisi':
        return Icons.meeting_room;
      case 'Restoran & Lokanta':
        return Icons.restaurant_menu;
      case 'Rezidans Katı & Ofisi':
        return Icons.domain;
      case 'Sağlık Merkezi':
        return Icons.local_hospital;
      case 'Spor Tesisi':
        return Icons.sports_soccer;
      case 'Villa':
        return Icons.villa;
      case 'Yurt':
        return Icons.night_shelter;
      default:
        return Icons.business;
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
              'Emlak > İş Yeri > Devren Satılık',
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
        itemCount: _workplaceTransferSaleSubcategories.length,
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
                  _getIconForCategory(_workplaceTransferSaleSubcategories[index]),
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
              title: Text(
                _workplaceTransferSaleSubcategories[index],
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
