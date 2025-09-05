import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CarBrandsScreen extends StatelessWidget {
  const CarBrandsScreen({super.key});

  final List<Map<String, dynamic>> _carBrands = const [
    {
      'name': 'Tüm "Otomobil" İlanları',
      'count': '366.258',
      'isHeader': true,
    },
    {
      'name': 'Abarth',
      'count': '3',
      'logo': 'assets/logos/abarth.png', // Logo eklenecek
    },
    {
      'name': 'Acura',
      'count': '1',
      'logo': 'assets/logos/acura.png',
    },
    {
      'name': 'Aion',
      'count': '4',
      'logo': 'assets/logos/aion.png',
    },
    {
      'name': 'Alfa Romeo',
      'count': '835',
      'logo': 'assets/logos/alfa_romeo.png',
    },
    {
      'name': 'Anadol',
      'count': '1',
      'logo': 'assets/logos/anadol.png',
    },
    {
      'name': 'Arora',
      'count': '11',
      'logo': 'assets/logos/arora.png',
    },
    {
      'name': 'Aston Martin',
      'count': '45',
      'logo': 'assets/logos/aston_martin.png',
    },
    {
      'name': 'Audi',
      'count': '13.510',
      'logo': 'assets/logos/audi.png',
    },
    {
      'name': 'Bentley',
      'count': '81',
      'logo': 'assets/logos/bentley.png',
    },
    {
      'name': 'BMW',
      'count': '24.669',
      'logo': 'assets/logos/bmw.png',
    },
    {
      'name': 'Buick',
      'count': '5',
      'logo': 'assets/logos/buick.png',
    },
    {
      'name': 'BYD',
      'count': '89',
      'logo': 'assets/logos/byd.png',
    },
    {
      'name': 'Cadillac',
      'count': '31',
      'logo': 'assets/logos/cadillac.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Otomobil',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF1A5083), // Görseldeki mavi renk
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {
              // Kamera işlevi
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: () {
              // Filtre işlevi
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _carBrands.length,
        itemBuilder: (context, index) {
          final brand = _carBrands[index];
          
          if (brand['isHeader'] == true) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    brand['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1A5083),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '(${brand['count']})',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1A5083),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: Color(0xFF1A5083),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }

          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade200,
                  width: 1,
                ),
              ),
            ),
            child: ListTile(
              leading: SizedBox(
                width: 40,
                height: 40,
                child: Icon(Icons.directions_car, color: Colors.grey[600]), // Geçici olarak icon kullanıyoruz
              ),
              title: Text(
                brand['name'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '(${brand['count']})',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.grey[400],
                  ),
                ],
              ),
              onTap: () {
                // Marka detay sayfasına yönlendirme
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${brand['name']} seçildi'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1A5083),
        unselectedItemColor: Colors.grey,
        currentIndex: 1, // Arama seçili
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Vitrin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Arama',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'İlan Ver',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_in_ar),
            label: 'Servisler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Bana Özel',
          ),
        ],
      ),
    );
  }
}
