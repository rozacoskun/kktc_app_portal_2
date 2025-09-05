import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ClassifiedsScreen extends StatelessWidget {
  const ClassifiedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.background,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                
                // Modern Category Cards Row
                // First Row
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildModernCategoryCard(
                          'Araba',
                          Icons.directions_car,
                          AppColors.primary,
                          'Araç İlanları',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildModernCategoryCard(
                          'Emlak',
                          Icons.home,
                          AppColors.primary,
                          'Emlak İlanları',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildModernCategoryCard(
                          'Elektronik',
                          Icons.laptop,
                          AppColors.primary,
                          'Elektronik İlanları',
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 12),
                
                // Second Row
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 44) / 3,
                        child: _buildModernCategoryCard(
                          '2. El Eşya',
                          Icons.chair,
                          AppColors.primary,
                          'İkinci El Eşya İlanları',
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 44) / 3,
                        child: _buildModernCategoryCard(
                          'İş İlanı',
                          Icons.work,
                          AppColors.primary,
                          'İş ve Kariyer İlanları',
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 28),
                
                // Son 24 Saat Section
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Text(
                          'Son 24 Saat',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[500],
                        size: 16,
                      ),
                    ],
                  ),
                ),
                
                // Acil İlanlar Section
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.priority_high,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Text(
                          'Acil İlanlar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[500],
                        size: 16,
                      ),
                    ],
                  ),
                ),
                
                // Modern Section Header
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'İlgilenebileceğiniz İlanlar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 0),
                
                // Modern Ad Listing Cards
                _buildModernAdCard(
                  'NUR YAPI\'DAN YATIRIM FIRSATI ! 600 BİN PEŞİNATLA ACİL SATILIK !',
                  'İstanbul, Esenyurt',
                  '1.495.000 TL',
                  Icons.home,
                  AppColors.primary,
                ),
                
                const SizedBox(height: 0),
                
                _buildModernAdCard(
                  'BAHÇELİ YATIRIMLIK İSKANLI METROBÜSE 10DK ACİL SATILIK 2+1',
                  'İstanbul, Esenyurt',
                  '1.538.000 TL',
                  Icons.business,
                  AppColors.secondary,
                ),
                
                const SizedBox(height: 0),
                
                _buildModernAdCard(
                  'MERSİN\'DE GENİŞ 2+1 DENİZE SIFIR HAVUZ DENİZ MANZARALI LÜX DAİRE',
                  'Mersin, Mezitli',
                  '1.750.000 TL',
                  Icons.apartment,
                  AppColors.accent,
                ),
                
                const SizedBox(height: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildModernAdCard(String description, String location, String price, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.3),
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Photo Container
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 32,
              color: AppColors.primary,
            ),
          ),
          
          const SizedBox(width: 16),
          
          // Right Content Area
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top: Description
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                
                const SizedBox(height: 20),
                
                // Bottom Row: Location and Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left: Location
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 14,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    
                    // Right: Price
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernCategoryCard(String title, IconData icon, Color color, String subtitle) {
    return Container(
      height: 110,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color,
                  color.withOpacity(0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 26,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
