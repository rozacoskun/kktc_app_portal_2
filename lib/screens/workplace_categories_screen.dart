import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'workplace_sale_categories_screen.dart';
import 'workplace_rent_categories_screen.dart';
import 'workplace_transfer_sale_categories_screen.dart';
import 'workplace_transfer_rent_categories_screen.dart';

class WorkplaceCategoriesScreen extends StatelessWidget {
  const WorkplaceCategoriesScreen({super.key});

  final List<String> _workplaceSubcategories = const [
    'Satılık İş Yeri',
    'Kiralık İş Yeri',
    'Devren Satılık İş Yeri',
    'Devren Kiralık İş Yeri',
  ];

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Satılık İş Yeri':
        return Icons.store;
      case 'Kiralık İş Yeri':
        return Icons.vpn_key;
      case 'Devren Satılık İş Yeri':
        return Icons.transfer_within_a_station;
      case 'Devren Kiralık İş Yeri':
        return Icons.sync_alt;
      default:
        return Icons.business;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'İlan Ver',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Emlak > İş Yeri',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
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
        itemCount: _workplaceSubcategories.length,
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
                  _getIconForCategory(_workplaceSubcategories[index]),
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
              title: Text(
                _workplaceSubcategories[index],
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
                switch (_workplaceSubcategories[index]) {
                  case 'Satılık İş Yeri':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WorkplaceSaleCategoriesScreen(),
                      ),
                    );
                    break;
                  case 'Kiralık İş Yeri':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WorkplaceRentCategoriesScreen(),
                      ),
                    );
                    break;
                  case 'Devren Satılık İş Yeri':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WorkplaceTransferSaleCategoriesScreen(),
                      ),
                    );
                    break;
                  case 'Devren Kiralık İş Yeri':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WorkplaceTransferRentCategoriesScreen(),
                      ),
                    );
                    break;
                }
              },
            ),
          );
        },
      ),
    );
  }
}
