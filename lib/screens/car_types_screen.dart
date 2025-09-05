import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CarTypesScreen extends StatelessWidget {
  const CarTypesScreen({super.key});

  final List<Map<String, dynamic>> _carTypes = const [
    {
      'name': 'Sedan',
      'icon': Icons.directions_car,
      'description': 'Klasik 4 kapılı otomobiller'
    },
    {
      'name': 'Hatchback',
      'icon': Icons.directions_car,
      'description': 'Kompakt ve pratik şehir araçları'
    },
    {
      'name': 'Station Wagon',
      'icon': Icons.directions_car,
      'description': 'Geniş bagaj hacimli aile araçları'
    },
    {
      'name': 'Coupe',
      'icon': Icons.directions_car,
      'description': 'Sportif 2 kapılı otomobiller'
    },
    {
      'name': 'Cabrio',
      'icon': Icons.directions_car,
      'description': 'Üstü açılabilen spor otomobiller'
    },
    {
      'name': 'Roadster',
      'icon': Icons.directions_car,
      'description': '2 kişilik üstü açık spor otomobiller'
    },
    {
      'name': 'Crossover',
      'icon': Icons.directions_car,
      'description': 'SUV-Sedan karması yükseltilmiş otomobiller'
    },
    {
      'name': 'Sport Car',
      'icon': Icons.directions_car,
      'description': 'Yüksek performanslı spor otomobiller'
    },
    {
      'name': 'Luxury Car',
      'icon': Icons.directions_car,
      'description': 'Lüks segment prestij otomobiller'
    },
    {
      'name': 'Hybrid',
      'icon': Icons.directions_car,
      'description': 'Hibrit motorlu ekonomik otomobiller'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Otomobil Çeşitleri',
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primary, AppColors.accent],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: _carTypes.length,
            itemBuilder: (context, index) {
              final carType = _carTypes[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      // TODO: Navigate to car listing page
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${carType['name']} seçildi'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              carType['icon'] as IconData,
                              color: AppColors.primary,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  carType['name'] as String,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  carType['description'] as String,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey[400],
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
