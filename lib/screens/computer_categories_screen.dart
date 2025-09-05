import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'electronics_details_screen.dart';
import 'laptop_categories_screen.dart';
import 'desktop_categories_screen.dart';

class ComputerCategoriesScreen extends StatelessWidget {
  const ComputerCategoriesScreen({super.key});

  final List<String> _categories = const [
    'Dizüstü (Notebook)',
    'Masaüstü',
    'Monitör',
    'Sunucu',
    'Aksesuarlar',
  ];

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Dizüstü (Notebook)':
        return Icons.laptop;
      case 'Masaüstü':
        return Icons.desktop_windows;


      case 'Monitör':
        return Icons.monitor;
      case 'Sunucu':
        return Icons.dns;
      case 'Aksesuarlar':
        return Icons.mouse;
      default:
        return Icons.computer;
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
              'Elektronik > Bilgisayar',
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
                      switch (_categories[index]) {
                        case 'Dizüstü (Notebook)':
                          return const LaptopCategoriesScreen();
                        case 'Masaüstü':
                          return const DesktopCategoriesScreen();
                        default:
                          return ElectronicsDetailsScreen(
                            category: 'Bilgisayar > ${_categories[index]}',
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
