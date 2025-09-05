import 'package:flutter/material.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/classifieds_screen.dart';
import 'screens/content_sections_screen.dart';
import 'screens/post_ad_screen.dart';
import 'utils/app_colors.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(const KktcAppPortal());
}

class KktcAppPortal extends StatelessWidget {
  const KktcAppPortal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kktc App Portal',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  bool _isMenuOpen = false;
  
  final List<Widget> _screens = [
    const ContentSectionsScreen(), // İçerik - index 0
    const ClassifiedsScreen(),     // İlanlar - index 1
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Ana içerik
          Scaffold(
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
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            setState(() {
              _isMenuOpen = !_isMenuOpen;
            });
          },
        ),
        title: const Text(
          'KKTC App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              _showCombinedPanel(context);
            },
          ),
        ],
      ),
            body: _screens[_currentIndex],
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
                onTap: () => setState(() => _currentIndex = 0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  transform: Matrix4.identity()..scale(_currentIndex == 0 ? 1.1 : 1.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: _currentIndex == 0 ? AppColors.primary : Colors.grey[600],
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Orta boşluk
            const SizedBox(width: 20),
            
            // İlanlar butonu
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _currentIndex = 1),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  transform: Matrix4.identity()..scale(_currentIndex == 1 ? 1.1 : 1.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: _currentIndex == 1 ? AppColors.primary : Colors.grey[600],
                        size: 32,
                        weight: 900,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Orta boşluk
            const SizedBox(width: 20),
            
            // İlan Ver butonu
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PostAdScreen()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColors.primary,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Sağ boşluk
            const SizedBox(width: 20),
          ],
        ),
      ),
            ),
          
          // Hamburger menü
          if (_isMenuOpen) _buildSlideMenu(),
          
          // Menü dışına tıklama overlay'i
          if (_isMenuOpen)
            Positioned(
              left: 300,
              top: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isMenuOpen = false;
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
        ],
      ),
    );
  }



  void _showCombinedPanel(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          color: Colors.black.withOpacity(0.5),
          child: GestureDetector(
            onTap: () {},
            child: DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.3,
              maxChildSize: 0.6,
              builder: (context, scrollController) => Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Profile Button
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          _showProfilePanel(context);
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppColors.primary.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Profil',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'Profil bilgilerinizi görüntüleyin ve düzenleyin',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.primary,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Settings Button
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          _showSettingsPanel(context);
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.accent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppColors.accent.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.accent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Ayarlar',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.accent,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'Uygulama ayarlarını yapılandırın',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.accent,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showProfilePanel(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: const ProfileScreen(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSettingsPanel(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: const SettingsScreen(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlideMenu() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      left: _isMenuOpen ? 0 : -300,
      top: 0,
      bottom: 0,
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: AppColors.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(2, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            // Menü başlığı
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: AppColors.greenGradient,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  const Text(
                    'Menü',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isMenuOpen = false;
                      });
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            
            // Menü öğeleri
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMenuItem('Kıbrıs Genel Bilgiler', Icons.info_rounded),
                    _buildMenuItem('Kıbrıs Tarihi', Icons.history_rounded),
                    
                    // Gezilecek Yerler - Alt menü
                    _buildMenuItemWithSubmenu(
                      'Gezilecek Yerler',
                      Icons.place_rounded,
                      [
                        'Tarihi ve Dini',
                        'Doğa Güzellikleri',
                        'Restoranlar',
                        'Oteller Casinolar',
                      ],
                    ),
                    
                    _buildMenuItem('Kıbrıs Türkçesi', Icons.language_rounded),
                    _buildMenuItem('Kıbrıs Mutfağı', Icons.restaurant_rounded),
                    _buildMenuItem('Üniversiteler', Icons.school_rounded),
                    _buildMenuItem('Spor Kulüpleri', Icons.sports_soccer_rounded),
                    _buildMenuItem('Hastaneler', Icons.local_hospital_rounded),
                    _buildMenuItem('Kıbrıs Efsaneleri', Icons.auto_stories_rounded),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Menü öğesi tıklandığında yapılacak işlem
            setState(() {
              _isMenuOpen = false;
            });
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: AppColors.primary,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
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

  Widget _buildMenuItemWithSubmenu(String title, IconData icon, List<String> subItems) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // Ana menü öğesi tıklandığında yapılacak işlem
                  setState(() {
                    _isMenuOpen = false;
                  });
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Icon(
                        icon,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        title,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Alt menü öğeleri
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: subItems.map((subItem) => 
                Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        // Alt menü öğesi tıklandığında yapılacak işlem
                        setState(() {
                          _isMenuOpen = false;
                        });
                      },
                      borderRadius: BorderRadius.circular(6),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Text(
                          '• $subItem',
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
