import 'package:flutter/material.dart';

import '../shared/constants/app_strings.dart';
import 'app_router.dart';
import 'app_theme.dart';

class CampusKartApp extends StatelessWidget {
  const CampusKartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: AppRouter.router,
    );
  }
}
