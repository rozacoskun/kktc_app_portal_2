import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'car_search_filters_screen.dart';

class CarBrandsByYearScreen extends StatelessWidget {
  final int year;
  final String category;

  const CarBrandsByYearScreen({
    super.key, 
    required this.year,
    required this.category,
  });

  final List<String> _carBrands = const [
    'Alfa Romeo',
    'Anadol',
    'Aston Martin',
    'Audi',
    'Bentley',
    'BMW',
    'Chevrolet',
    'Chrysler',
    'Citroen',
    'Dacia',
    'Daihatsu',
    'Dodge',
    'Dongfeng',
    'DS Automobiles',
    'Ferrari',
    'Fiat',
    'Ford',
    'Honda',
    'Hyundai',
    'Infiniti',
    'Isuzu',
    'Jaguar',
    'Kia',
    'Lamborghini',
    'Lexus',
    'Maserati',
    'Mazda',
    'McLaren',
    'Mercedes-Benz',
    'MG',
    'MINI',
    'Mitsubishi',
    'Nissan',
    'Opel',
    'Peugeot',
    'Porsche',
    'Proton',
    'Renault',
    'Rolls-Royce',
    'Seat',
    'Skoda',
    'Smart',
    'Subaru',
    'Suzuki',
    'Tesla',
    'Tofaş',
    'Toyota',
    'Triumph',
    'Vauxhall',
    'Volkswagen',
    'Volvo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$year Model Araçlar',
          style: const TextStyle(
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
        itemCount: _carBrands.length,
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
                  Icons.directions_car,
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
              title: Text(
                _carBrands[index],
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
                      year: year,
                      brand: _carBrands[index],
                      category: category,
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