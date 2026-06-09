import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_spacing.dart';

class RequestServiceScreen extends StatefulWidget {
  const RequestServiceScreen({super.key});

  @override
  State<RequestServiceScreen> createState() => _RequestServiceScreenState();
}

class _RequestServiceScreenState extends State<RequestServiceScreen> {
  String _selectedServiceType = 'one_way';
  late TextEditingController _pickupController;
  late TextEditingController _dropoffController;
  late TextEditingController _instructionsController;

  @override
  void initState() {
    super.initState();
    _pickupController = TextEditingController();
    _dropoffController = TextEditingController();
    _instructionsController = TextEditingController();
  }

  @override
  void dispose() {
    _pickupController.dispose();
    _dropoffController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  void _confirmRequest() {
    final messenger = ScaffoldMessenger.of(context);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: const Text('Request confirmed in prototype mode.'),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        context.push('/track-order');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.onSurface),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Request a Service',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg - AppSpacing.xs,
              AppSpacing.lg,
              AppSpacing.lg - AppSpacing.xs,
              120,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildServiceTypeSection(),
                    const SizedBox(height: AppSpacing.lg),
                    _buildLocationSection(),
                    const SizedBox(height: AppSpacing.lg),
                    _buildSpecialInstructionsSection(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomActionButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceTypeSection() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Service Type',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: _buildServiceTypeCard(
                  title: 'One-way',
                  price: '₱20',
                  icon: Icons.arrow_right_alt,
                  value: 'one_way',
                  isSelected: _selectedServiceType == 'one_way',
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _buildServiceTypeCard(
                  title: 'Round-trip',
                  price: '₱35',
                  icon: Icons.sync_alt,
                  value: 'round_trip',
                  isSelected: _selectedServiceType == 'round_trip',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceTypeCard({
    required String title,
    required String price,
    required IconData icon,
    required String value,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => setState(() => _selectedServiceType = value),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF0F8F4) : AppColors.surface,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.outlineVariant,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 32,
                  color: AppColors.primary,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  price,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.onSurfaceVariant,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.outlineVariant,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationSection() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildLocationField(
            label: 'Pickup Location',
            placeholder: 'e.g. Main Library, Gate 2',
            iconBackground: AppColors.primaryContainer,
            icon: Icons.location_on,
            iconColor: AppColors.onPrimaryContainer,
            controller: _pickupController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: 2,
              height: 24,
              color: AppColors.outlineVariant.withValues(alpha: 0.4),
              margin: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            ),
          ),
          _buildLocationField(
            label: 'Drop-off Location',
            placeholder: 'e.g. Engineering Building',
            iconBackground: AppColors.errorContainer,
            icon: Icons.flag,
            iconColor: AppColors.onErrorContainer,
            controller: _dropoffController,
          ),
        ],
      ),
    );
  }

  Widget _buildLocationField({
    required String label,
    required String placeholder,
    required Color iconBackground,
    required IconData icon,
    required Color iconColor,
    required TextEditingController controller,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: iconBackground,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 20,
            color: iconColor,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.primary,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: placeholder,
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                ),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.onSurface,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSpecialInstructionsSection() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.notes,
                size: 16,
                color: AppColors.onSurfaceVariant,
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                'Special Instructions',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: _instructionsController,
            maxLines: 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.outlineVariant),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.outlineVariant),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
              hintText:
                  'e.g., specific gate, handle with care, call upon arrival...',
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
              contentPadding: const EdgeInsets.all(AppSpacing.md),
            ),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActionButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg - AppSpacing.xs,
        AppSpacing.md,
        AppSpacing.lg - AppSpacing.xs,
        AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(
            color: AppColors.outlineVariant.withValues(alpha: 0.2),
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 20,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: ElevatedButton(
          onPressed: _confirmRequest,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            elevation: 4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Confirm Request'),
              const SizedBox(width: AppSpacing.xs),
              const Icon(Icons.arrow_forward, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
