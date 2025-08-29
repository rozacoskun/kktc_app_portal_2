import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'car_search_filters_screen.dart';

class ElectricMotorcycleBrandsScreen extends StatelessWidget {
  const ElectricMotorcycleBrandsScreen({super.key});

  final List<String> _brands = const [
    'Volta',
    'Arora',
    'RKS',
    'Yuki',
    'Ecotrend',
    'Super Soco',
    'NIU',
    'Horwin',
    'Vmoto',
    'Zero Motorcycles',
    'Energica',
    'Silence',
    'Segway',
    'Tinbot',
    'Sunra',
  ];

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
              'Araba > Elektrikli Araçlar > Elektrikli Motosiklet',
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
        itemCount: _brands.length,
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
                  Icons.electric_bike,
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
              title: Text(
                _brands[index],
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
                    builder: (context) => CarSearchFiltersScreen(
                      category: 'Elektrikli Motosiklet',
                      brand: _brands[index],
                      year: DateTime.now().year,
                    ),
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
