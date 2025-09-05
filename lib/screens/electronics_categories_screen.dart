import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'electronics_details_screen.dart';
import 'computer_categories_screen.dart';

class ElectronicsCategoriesScreen extends StatelessWidget {
  const ElectronicsCategoriesScreen({super.key});

  final List<String> _categories = const [
    'Bilgisayar',
    'Telefon',
    'Tablet',
    'Çevre Birimleri',
    'Kamera & Fotoğraf',
    'Ev Elektroniği',
    'Ev Aletleri',
    'Akıllı Saat',
    'Oyunculara Özel',
    'Drone',
    'TV',
    'Projeksiyon Cihazı',
  ];

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Bilgisayar':
        return Icons.computer;
      case 'Telefon':
        return Icons.phone_android;
      case 'Tablet':
        return Icons.tablet_mac;
      case 'Kamera & Fotoğraf':
        return Icons.camera_alt;
      case 'Ev Elektroniği':
        return Icons.home;
      case 'Ev Aletleri':
        return Icons.kitchen;
      case 'Akıllı Saat':
        return Icons.watch;
      case 'Oyunculara Özel':
        return Icons.sports_esports;
      case 'Drone':
        return Icons.airplanemode_active;
      case 'TV':
        return Icons.tv;
      case 'Projeksiyon Cihazı':
        return Icons.videocam;
      case 'Çevre Birimleri':
        return Icons.keyboard;
      default:
        return Icons.devices_other;
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
              'Elektronik',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      if (_categories[index] == 'Bilgisayar') {
                        return const ComputerCategoriesScreen();
                      } else {
                        return ElectronicsDetailsScreen(
                          category: _categories[index],
                        );
                      }
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
