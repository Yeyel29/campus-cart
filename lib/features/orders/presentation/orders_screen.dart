import 'package:flutter/material.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/widgets/campus_kart_bottom_navigation.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orders'), backgroundColor: AppColors.surface),
      body: const Center(child: Text('Orders Screen')),
      bottomNavigationBar: const CampusKartBottomNavigation(selectedIndex: 1),
    );
  }
}
