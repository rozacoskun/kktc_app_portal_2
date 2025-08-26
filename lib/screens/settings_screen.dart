import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/gradient_card.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _locationEnabled = true;
  String _selectedLanguage = 'Türkçe';
  String _selectedCurrency = 'TL';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: AppColors.background,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Info Card
              _buildAppInfoCard(),
              const SizedBox(height: 30),
              
              // General Settings
              _buildSettingsSection(
                'Genel Ayarlar',
                Icons.settings,
                [
                  _buildSwitchSetting(
                    'Bildirimler',
                    'Uygulama bildirimlerini al',
                    Icons.notifications,
                    _notificationsEnabled,
                    (value) {
                      setState(() {
                        _notificationsEnabled = value;
                      });
                    },
                  ),
                  _buildSwitchSetting(
                    'Karanlık Mod',
                    'Karanlık tema kullan',
                    Icons.dark_mode,
                    _darkModeEnabled,
                    (value) {
                      setState(() {
                        _darkModeEnabled = value;
                      });
                    },
                  ),
                  _buildSwitchSetting(
                    'Konum',
                    'Konum servislerini kullan',
                    Icons.location_on,
                    _locationEnabled,
                    (value) {
                      setState(() {
                        _locationEnabled = value;
                      });
                    },
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Language and Currency Settings
              _buildSettingsSection(
                'Dil ve Para Birimi',
                Icons.language,
                [
                  _buildDropdownSetting(
                    'Dil',
                    'Uygulama dilini seçin',
                    Icons.translate,
                    _selectedLanguage,
                    ['Türkçe', 'English', 'Ελληνικά'],
                    (value) {
                      setState(() {
                        _selectedLanguage = value!;
                      });
                    },
                  ),
                  _buildDropdownSetting(
                    'Para Birimi',
                    'Para birimini seçin',
                    Icons.attach_money,
                    _selectedCurrency,
                    ['TL', 'USD', 'EUR', 'GBP'],
                    (value) {
                      setState(() {
                        _selectedCurrency = value!;
                      });
                    },
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Account Settings
              _buildSettingsSection(
                'Hesap Ayarları',
                Icons.account_circle,
                [
                  _buildActionSetting(
                    'Şifre Değiştir',
                    'Hesap şifrenizi güncelleyin',
                    Icons.lock,
                    () {
                      // Navigate to password change
                    },
                  ),
                  _buildActionSetting(
                    'E-posta Değiştir',
                    'E-posta adresinizi güncelleyin',
                    Icons.email,
                    () {
                      // Navigate to email change
                    },
                  ),
                  _buildActionSetting(
                    'Hesabı Sil',
                    'Hesabınızı kalıcı olarak silin',
                    Icons.delete_forever,
                    () {
                      // Show delete account dialog
                    },
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Contact and Support
              _buildSettingsSection(
                'İletişim ve Destek',
                Icons.support_agent,
                [
                  _buildActionSetting(
                    'Uygulama Hakkında',
                    'Versiyon ve lisans bilgileri',
                    Icons.info,
                    () {
                      // Show app info
                    },
                  ),
                  _buildActionSetting(
                    'Yardım Merkezi',
                    'Sık sorulan sorular ve yardım',
                    Icons.help,
                    () {
                      // Navigate to help center
                    },
                  ),
                  _buildActionSetting(
                    'Geri Bildirim',
                    'Uygulama hakkında görüş bildirin',
                    Icons.feedback,
                    () {
                      // Navigate to feedback
                    },
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // App Creators Contact
              _buildContactSection(),
              
              const SizedBox(height: 30),
              
              // Logout Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Show logout confirmation
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Çıkış Yap'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.danger,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppInfoCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(20),
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
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.home,
              size: 40,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Kktc App Portal',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Versiyon 1.0.0',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Kıbrıs\'ın en kapsamlı uygulaması',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(String title, IconData icon, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        
        ...children.map((child) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: child,
        )),
      ],
    );
  }

  Widget _buildSwitchSetting(String title, String subtitle, IconData icon, bool value, ValueChanged<bool> onChanged) {
    return ColoredCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
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
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownSetting(String title, String subtitle, IconData icon, String value, List<String> options, ValueChanged<String?> onChanged) {
    return ColoredCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppColors.accent,
              size: 24,
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
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          DropdownButton<String>(
            value: value,
            items: options.map((option) {
              return DropdownMenuItem(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: onChanged,
            underline: Container(),
          ),
        ],
      ),
    );
  }

  Widget _buildActionSetting(String title, String subtitle, IconData icon, VoidCallback onTap) {
    return ColoredCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.warning.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppColors.warning,
              size: 24,
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
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
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

  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Uygulama Geliştiricileri',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: AppColors.accentGradient,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              const Text(
                'İletişim Bilgileri',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              _buildContactItem(
                'E-posta',
                'info@kktcappportal.com',
                Icons.email,
              ),
              const SizedBox(height: 12),
              _buildContactItem(
                'Telefon',
                '+90 392 123 45 67',
                Icons.phone,
              ),
              const SizedBox(height: 12),
              _buildContactItem(
                'Adres',
                'Lefkoşa, Kıbrıs',
                Icons.location_on,
              ),
              const SizedBox(height: 16),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSocialButton(
                    'Facebook',
                    Icons.facebook,
                    AppColors.primary,
                  ),
                  _buildSocialButton(
                    'YouTube',
                    Icons.play_circle_filled,
                    AppColors.accent,
                  ),
                  _buildSocialButton(
                    'Instagram',
                    Icons.camera_alt,
                    AppColors.warning,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem(String title, String value, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(String label, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: color,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
