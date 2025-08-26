import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/gradient_card.dart';

class ContentSectionsScreen extends StatelessWidget {
  const ContentSectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Content Area
          Expanded(
            child: Container(
              color: AppColors.background,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    
                    // Content Categories Grid
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.1,
                      children: [
                        _buildContentCard(
                          'Kıbrıs Genel Bilgi',
                          Icons.info,
                          'Kıbrıs hakkında genel bilgiler ve tarih',
                          AppColors.primaryGradient,
                        ),
                        _buildContentCard(
                          'Kıbrıs Türkçesi',
                          Icons.language,
                          'Kıbrıs Türkçesi ve yerel ifadeler',
                          AppColors.accentGradient,
                        ),
                        _buildContentCard(
                          'Kıbrıs Yemekleri',
                          Icons.restaurant,
                          'Geleneksel Kıbrıs mutfağı',
                          AppColors.warningGradient,
                        ),
                        _buildContentCard(
                          'Spor Kulüpleri',
                          Icons.sports_soccer,
                          'Kıbrıs spor kulüpleri ve takımları',
                          AppColors.primaryGradient,
                        ),
                        _buildContentCard(
                          'Üniversiteler',
                          Icons.school,
                          'Kıbrıs üniversiteleri ve eğitim',
                          AppColors.accentGradient,
                        ),
                        _buildContentCard(
                          'Hastaneler',
                          Icons.local_hospital,
                          'Kıbrıs hastaneleri ve sağlık',
                          AppColors.warningGradient,
                        ),
                        _buildContentCard(
                          'Oteller ve Casinolar',
                          Icons.hotel,
                          'Kıbrıs otelleri ve casino bilgileri',
                          AppColors.primaryGradient,
                        ),
                        _buildContentCard(
                          'Kıbrıs Efsaneleri',
                          Icons.auto_stories,
                          'Geleneksel Kıbrıs efsaneleri',
                          AppColors.accentGradient,
                        ),
                        _buildContentCard(
                          'Kıbrıs Şarkıları',
                          Icons.music_note,
                          'Kıbrıs müziği ve şarkıları',
                          AppColors.warningGradient,
                        ),
                        _buildContentCard(
                          'Sinemalar',
                          Icons.movie,
                          'Kıbrıs sinemaları ve film bilgileri',
                          AppColors.primaryGradient,
                        ),
                        _buildContentCard(
                          'AI Videolar',
                          Icons.video_library,
                          'Yapay zeka ile oluşturulan videolar',
                          AppColors.accentGradient,
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Featured Content
                    const Text(
                      'Öne Çıkan İçerikler',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    _buildFeaturedContent(
                      'Kıbrıs\'ın En İyi Restoranları',
                      '2024 yılında mutlaka ziyaret edilmesi gereken restoranlar',
                      Icons.restaurant,
                      AppColors.accent,
                    ),
                    const SizedBox(height: 16),
                    _buildFeaturedContent(
                      'Kıbrıs Tarihi: Antik Çağlardan Günümüze',
                      'Kıbrıs\'ın zengin tarihi ve kültürel mirası',
                      Icons.history_edu,
                      AppColors.primary,
                    ),
                    const SizedBox(height: 16),
                    _buildFeaturedContent(
                      'Kıbrıs\'ta Gezilecek Yerler',
                      'Turistlerin mutlaka görmesi gereken yerler',
                      Icons.place,
                      AppColors.warning,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentCard(String title, IconData icon, String description, LinearGradient gradient) {
    return GradientCard(
      gradient: gradient,
      onTap: () {
        // Navigate to content section
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 32,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedContent(String title, String description, IconData icon, Color color) {
    return ColoredCard(
      onTap: () {
        // Navigate to featured content
      },
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: color,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.textSecondary,
            size: 16,
          ),
        ],
      ),
    );
  }
}
