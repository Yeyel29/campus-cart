import 'package:flutter/material.dart';

import '../../../shared/constants/app_colors.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Order'),
        backgroundColor: AppColors.surface,
      ),
      body: const Center(child: Text('Order Tracking Screen')),
    );
  }
}
