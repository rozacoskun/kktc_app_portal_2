import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'dart:async';

class ContentSectionsScreen extends StatefulWidget {
  const ContentSectionsScreen({super.key});

  @override
  State<ContentSectionsScreen> createState() => _ContentSectionsScreenState();
}

class _ContentSectionsScreenState extends State<ContentSectionsScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  // Slayt fotoğrafları
  final List<String> _slideImages = [
    'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&h=400&fit=crop',
    'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=800&h=400&fit=crop',
    'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=800&h=400&fit=crop',
    'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&h=400&fit=crop',
    'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=800&h=400&fit=crop',
  ];

  // Şehirler listesi
  final List<Map<String, dynamic>> _cities = [
    {
      'name': 'Girne', 
      'icon': Icons.location_city, 
      'color': AppColors.primary,
      'image': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop'
    },
    {
      'name': 'Lefkoşa', 
      'icon': Icons.location_city, 
      'color': AppColors.primary,
      'image': 'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=400&h=300&fit=crop'
    },
    {
      'name': 'Mağusa', 
      'icon': Icons.location_city, 
      'color': AppColors.primary,
      'image': 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=400&h=300&fit=crop'
    },
    {
      'name': 'Güzelyurt', 
      'icon': Icons.location_city, 
      'color': AppColors.primary,
      'image': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop'
    },
    {
      'name': 'İskele', 
      'icon': Icons.location_city, 
      'color': AppColors.primary,
      'image': 'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=400&h=300&fit=crop'
    },
    {
      'name': 'Karpaz', 
      'icon': Icons.location_city, 
      'color': AppColors.primary,
      'image': 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=400&h=300&fit=crop'
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _currentPage = (_currentPage + 1) % _slideImages.length;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Ana içerik
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Header Section
                  _buildHeaderSection(),
                  
                  // Main Content
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Cities Slider
                        _buildCitiesSlider(),
                        const SizedBox(height: 40),
                        
                        // Categories
                        _buildCategoriesSection(),
                        const SizedBox(height: 40),
                        
                        // News Section
                        _buildNewsSection(),
                        const SizedBox(height: 40),
                        
                        // Stats Section
                        _buildStatsSection(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      width: double.infinity,
      height: 280,
      child: Stack(
        children: [
          // Slayt fotoğrafları
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _slideImages.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(_slideImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          
          
          // İçerik - Metin
          Positioned(
            left: 20,
            right: 20,
            bottom: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'KKTC App Portal ile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Kıbrıs\'ı Keşfet',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
          // Slayt göstergeleri
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _slideImages.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index 
                        ? Colors.white 
                        : Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCitiesSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Şehirler',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
                letterSpacing: -0.5,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Tümünü Gör',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _cities.length,
            itemBuilder: (context, index) {
              final city = _cities[index];
              return Container(
                width: 160,
                margin: const EdgeInsets.only(right: 16),
                child: _buildCityCard(city, index),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCityCard(Map<String, dynamic> city, int index) {
    return GestureDetector(
      onTap: () {
        // Navigate to city page
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: city['color'].withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(city['image']),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    city['icon'],
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const Spacer(),
                Text(
                  city['name'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Keşfet',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }




  Widget _buildStatsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.divider,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Portal İstatistikleri',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  '1,234',
                  'Aktif İlan',
                  Icons.article,
                  AppColors.primary,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  '5,678',
                  'Kayıtlı Kullanıcı',
                  Icons.people,
                  AppColors.secondary,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  '890',
                  'Günlük Ziyaret',
                  Icons.visibility,
                  AppColors.accent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: color,
            size: 20,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildNewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Güncel Haberler',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        _buildNewsCard(
          'AI Destekli İlan Eşleştirme',
          'Yapay zeka ile daha iyi eşleştirme',
          Icons.auto_awesome,
          AppColors.primary,
        ),
        const SizedBox(height: 12),
        _buildNewsCard(
          'Yeni Turizm Sezonu',
          '2024 turizm sezonu başladı',
          Icons.flight_takeoff,
          AppColors.secondary,
        ),
      ],
    );
  }

  Widget _buildNewsCard(String title, String description, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.divider,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.textSecondary,
            size: 16,
          ),
        ],
      ),
    );
  }


  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kategoriler',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 20),
                    
                    // Content Categories Grid
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.1,
                      children: [
                        _buildContentCard(
                          'Kıbrıs Genel Bilgi',
                          Icons.info_rounded,
                          'Kıbrıs hakkında genel bilgiler ve tarih',
                          AppColors.primaryGradient,
                        ),
                        _buildContentCard(
                          'Kıbrıs Türkçesi',
                          Icons.language_rounded,
                          'Kıbrıs Türkçesi ve yerel ifadeler',
                          AppColors.accentGradient,
                        ),
                        _buildContentCard(
                          'Kıbrıs Yemekleri',
                          Icons.restaurant_rounded,
                          'Geleneksel Kıbrıs mutfağı',
                          AppColors.warningGradient,
                        ),
                        _buildContentCard(
                          'Spor Kulüpleri',
                          Icons.sports_soccer_rounded,
                          'Kıbrıs spor kulüpleri ve takımları',
                          AppColors.lightGradient,
                        ),
                        _buildContentCard(
                          'Üniversiteler',
                          Icons.school_rounded,
                          'Kıbrıs üniversiteleri ve eğitim',
                          AppColors.greenGradient,
                        ),
                        _buildContentCard(
                          'Hastaneler',
                          Icons.local_hospital_rounded,
                          'Kıbrıs hastaneleri ve sağlık',
                          AppColors.greyGradient,
                        ),
                        _buildContentCard(
                          'Oteller ve Casinolar',
                          Icons.hotel_rounded,
                          'Kıbrıs otelleri ve casino bilgileri',
                          const LinearGradient(
                            colors: [AppColors.accent, AppColors.primary],
                          ),
                        ),
                        _buildContentCard(
                          'Kıbrıs Efsaneleri',
                          Icons.auto_stories_rounded,
                          'Geleneksel Kıbrıs efsaneleri',
                          const LinearGradient(
                            colors: [AppColors.warning, AppColors.secondary],
                          ),
                        ),
                        _buildContentCard(
                          'Kıbrıs Şarkıları',
                          Icons.music_note_rounded,
                          'Kıbrıs müziği ve şarkıları',
                          const LinearGradient(
                            colors: [AppColors.primary, AppColors.warning],
                          ),
                        ),
                        _buildContentCard(
                          'Sinemalar',
                          Icons.movie_rounded,
                          'Kıbrıs sinemaları ve film bilgileri',
                          const LinearGradient(
                            colors: [AppColors.secondary, AppColors.accent],
                          ),
                        ),
                        _buildContentCard(
                          'AI Videolar',
                          Icons.video_library_rounded,
                          'Yapay zeka ile oluşturulan videolar',
                          const LinearGradient(
                            colors: [AppColors.accent, AppColors.warning],
                          ),
                        ),
                      ],
        ),
      ],
    );
  }

  Widget _buildContentCard(String title, IconData icon, String description, LinearGradient gradient) {
    return GestureDetector(
      onTap: () {
        // Navigate to content section
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.divider,
            width: 1,
          ),
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: gradient.colors.first.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
            icon,
                color: gradient.colors.first,
                size: 24,
              ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
                color: AppColors.textPrimary,
              fontSize: 14,
                fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
            const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      ),
    );
  }


}
