import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'car_categories_screen.dart'; // Added import for CarCategoriesScreen

class PostAdScreen extends StatefulWidget {
  const PostAdScreen({super.key});

  @override
  State<PostAdScreen> createState() => _PostAdScreenState();
}

class _PostAdScreenState extends State<PostAdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primary, AppColors.accent],
            ),
          ),
        ),
        title: const Text(
          'İlan Ver',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: const Text(
                  'Kategori Seçin',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
               // Araba Kutusu
               GestureDetector(
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => const CarCategoriesScreen(),
                     ),
                   );
                 },
                 child: Container(
                   width: double.infinity,
                   padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                   decoration: BoxDecoration(
                     color: AppColors.primary.withOpacity(0.08),
                     borderRadius: BorderRadius.circular(12),
                   ),
                   child: Row(
                     children: [
                       Icon(
                         Icons.directions_car_outlined,
                         color: AppColors.primary,
                         size: 28,
                       ),
                       const SizedBox(width: 20),
                       Expanded(
                         child: Text(
                           'Araba',
                           style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.w600,
                             color: AppColors.primary,
                           ),
                         ),
                       ),
                       Icon(
                         Icons.arrow_forward_ios,
                         color: AppColors.primary.withOpacity(0.6),
                         size: 16,
                       ),
                     ],
                   ),
                 ),
               ),
               
               const SizedBox(height: 20),
               
               // Emlak Kutusu
               Container(
                 width: double.infinity,
                 padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                 decoration: BoxDecoration(
                   color: AppColors.primary.withOpacity(0.08),
                   borderRadius: BorderRadius.circular(12),
                 ),
                 child: Row(
                   children: [
                     Icon(
                       Icons.home_outlined,
                       color: AppColors.primary,
                       size: 28,
                     ),
                     const SizedBox(width: 20),
                     Expanded(
                       child: Text(
                         'Emlak',
                         style: TextStyle(
                           fontSize: 18,
                           fontWeight: FontWeight.w600,
                           color: AppColors.primary,
                         ),
                       ),
                     ),
                     Icon(
                       Icons.arrow_forward_ios,
                       color: AppColors.primary.withOpacity(0.6),
                       size: 16,
                     ),
                   ],
                 ),
               ),
               
               const SizedBox(height: 20),
               
               // Elektronik Kutusu
               Container(
                 width: double.infinity,
                 padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                 decoration: BoxDecoration(
                   color: AppColors.primary.withOpacity(0.08),
                   borderRadius: BorderRadius.circular(12),
                 ),
                 child: Row(
                   children: [
                     Icon(
                       Icons.devices_outlined,
                       color: AppColors.primary,
                       size: 28,
                     ),
                     const SizedBox(width: 20),
                     Expanded(
                       child: Text(
                         'Elektronik',
                         style: TextStyle(
                           fontSize: 18,
                           fontWeight: FontWeight.w600,
                           color: AppColors.primary,
                         ),
                       ),
                     ),
                     Icon(
                       Icons.arrow_forward_ios,
                       color: AppColors.primary.withOpacity(0.6),
                       size: 16,
                     ),
                   ],
                 ),
               ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Sol boşluk
            const SizedBox(width: 20),
            
            // İçerik butonu
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Ana sayfaya dön
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.grey[600],
                      size: 28,
                    ),
                  ],
                ),
              ),
            ),
            
            // Orta boşluk
            const SizedBox(width: 20),
            
            // İlanlar butonu
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Ana sayfaya dön
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey[600],
                      size: 32,
                      weight: 900,
                    ),
                  ],
                ),
              ),
            ),
            
            // Orta boşluk
            const SizedBox(width: 20),
            
            // İlan Ver butonu (aktif)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
            
            // Sağ boşluk
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
