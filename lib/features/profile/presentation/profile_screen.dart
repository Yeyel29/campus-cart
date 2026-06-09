import 'package:flutter/material.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/widgets/campus_kart_bottom_navigation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: AppColors.surface,
      ),
      body: const Center(child: Text('Profile Screen')),
      bottomNavigationBar: const CampusKartBottomNavigation(selectedIndex: 2),
    );
  }
}
