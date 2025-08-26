import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/gradient_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isEditing = false;
  
  // User profile data
  String _userName = 'Ahmet Yılmaz';
  String _userEmail = 'ahmet.yilmaz@email.com';
  String _userPhone = '+90 392 123 45 67';
  String _userLocation = 'Lefkoşa, Kıbrıs';
  final String _memberSince = 'Mart 2023';
  
  // Statistics
  int _totalListings = 12;
  int _soldListings = 8;
  final int _favoriteListings = 15;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
            },
          ),
        ],
      ),
      body: Container(
        color: AppColors.background,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Header
              _buildProfileHeader(),
              
              // Profile Statistics
              _buildProfileStatistics(),
              
              // Profile Actions
              _buildProfileActions(),
              
              // Listings Tabs
              _buildListingsTabs(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Avatar Section
          Stack(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person,
                  size: 60,
                  color: AppColors.primary,
                ),
              ),
              if (_isEditing)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // User Name
          if (_isEditing)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: TextEditingController(text: _userName),
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Adınızı girin',
                ),
                onChanged: (value) {
                  _userName = value;
                },
              ),
            )
          else
            Text(
              _userName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          
          const SizedBox(height: 8),
          
          // User Email
          if (_isEditing)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: TextEditingController(text: _userEmail),
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'E-posta girin',
                ),
                onChanged: (value) {
                  _userEmail = value;
                },
              ),
            )
          else
            Text(
              _userEmail,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          
          const SizedBox(height: 16),
          
          // Additional Info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildInfoItem('Telefon', _userPhone, Icons.phone),
              _buildInfoItem('Konum', _userLocation, Icons.location_on),
              _buildInfoItem('Üyelik', _memberSince, Icons.calendar_today),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white70,
          size: 20,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildProfileStatistics() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              'Toplam İlan',
              _totalListings.toString(),
              Icons.list_alt,
              AppColors.primaryGradient,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildStatCard(
              'Satılan',
              _soldListings.toString(),
              Icons.check_circle,
              AppColors.accentGradient,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildStatCard(
              'Favori',
              _favoriteListings.toString(),
              Icons.favorite,
              AppColors.warningGradient,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, LinearGradient gradient) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: gradient.colors.first.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileActions() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                // Navigate to settings
              },
              icon: const Icon(Icons.settings),
              label: const Text('Ayarlar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                // Navigate to help
              },
              icon: const Icon(Icons.help),
              label: const Text('Yardım'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListingsTabs() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.divider),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: AppColors.textSecondary,
              indicator: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              tabs: const [
                Tab(text: 'İlanlarım'),
                Tab(text: 'Satılanlar'),
                Tab(text: 'Favoriler'),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          SizedBox(
            height: 400,
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildMyListingsTab(),
                _buildSoldListingsTab(),
                _buildFavoritesTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyListingsTab() {
    final myListings = [
      {
        'title': 'BMW 320i Sedan',
        'price': '850.000',
        'status': 'Aktif',
        'views': '156',
        'date': '2 gün önce',
        'type': 'Araba',
        'color': AppColors.primary,
      },
      {
        'title': 'iPhone 14 Pro',
        'price': '25.000',
        'status': 'Aktif',
        'views': '89',
        'date': '1 hafta önce',
        'type': 'Elektronik',
        'color': AppColors.accent,
      },
      {
        'title': '2+1 Daire',
        'price': '1.200.000',
        'status': 'Beklemede',
        'views': '234',
        'date': '3 gün önce',
        'type': 'Emlak',
        'color': AppColors.warning,
      },
    ];

    return _buildListingsList(myListings, 'İlanlarım');
  }

  Widget _buildSoldListingsTab() {
    final soldListings = [
      {
        'title': 'Toyota Corolla',
        'price': '480.000',
        'status': 'Satıldı',
        'views': '312',
        'date': '2 hafta önce',
        'type': 'Araba',
        'color': AppColors.accent,
      },
      {
        'title': 'MacBook Air M2',
        'price': '45.000',
        'status': 'Satıldı',
        'views': '178',
        'date': '1 ay önce',
        'type': 'Elektronik',
        'color': AppColors.primary,
      },
      {
        'title': 'Villa 4+1',
        'price': '3.500.000',
        'status': 'Satıldı',
        'views': '567',
        'date': '3 ay önce',
        'type': 'Emlak',
        'color': AppColors.warning,
      },
    ];

    return _buildListingsList(soldListings, 'Satılan İlanlar');
  }

  Widget _buildFavoritesTab() {
    final favoriteListings = [
      {
        'title': 'Mercedes C200 AMG',
        'price': '1.250.000',
        'status': 'Favori',
        'views': '445',
        'date': '1 gün önce',
        'type': 'Araba',
        'color': AppColors.primary,
      },
      {
        'title': 'PS5 Console',
        'price': '15.000',
        'status': 'Favori',
        'views': '223',
        'date': '5 gün önce',
        'type': 'Elektronik',
        'color': AppColors.accent,
      },
      {
        'title': 'Deniz Manzaralı Daire',
        'price': '2.800.000',
        'status': 'Favori',
        'views': '678',
        'date': '1 hafta önce',
        'type': 'Emlak',
        'color': AppColors.warning,
      },
    ];

    return _buildListingsList(favoriteListings, 'Favori İlanlar');
  }

  Widget _buildListingsList(List<Map<String, dynamic>> listings, String title) {
    if (listings.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.inbox,
              size: 64,
              color: AppColors.textSecondary,
            ),
            const SizedBox(height: 16),
            Text(
              'Henüz $title yok',
              style: const TextStyle(
                fontSize: 18,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'İlan eklemeye başlayın!',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: listings.length,
      itemBuilder: (context, index) {
        final listing = listings[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: ColoredCard(
            onTap: () {
              // Navigate to listing details
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Listing Icon
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: listing['color'].withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getIconForType(listing['type']),
                      color: listing['color'],
                      size: 28,
                    ),
                  ),
                  
                  const SizedBox(width: 16),
                  
                  // Listing Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listing['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        
                        const SizedBox(height: 4),
                        
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: listing['color'].withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                listing['type'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: listing['color'],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: _getStatusColor(listing['status']).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                listing['status'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: _getStatusColor(listing['status']),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 8),
                        
                        Row(
                          children: [
                            Text(
                              '${listing['price']} TL',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.accent,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '${listing['views']} görüntüleme',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 4),
                        
                        Text(
                          listing['date'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Action Button
                  IconButton(
                    onPressed: () {
                      // Show options menu
                    },
                    icon: const Icon(
                      Icons.more_vert,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case 'Araba':
        return Icons.directions_car;
      case 'Emlak':
        return Icons.home;
      case 'Elektronik':
        return Icons.phone_android;
      default:
        return Icons.category;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Aktif':
        return AppColors.accent;
      case 'Satıldı':
        return AppColors.primary;
      case 'Beklemede':
        return AppColors.warning;
      case 'Favori':
        return AppColors.warning;
      default:
        return AppColors.textSecondary;
    }
  }
}
