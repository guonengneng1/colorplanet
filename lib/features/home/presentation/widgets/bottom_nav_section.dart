import 'package:flutter/material.dart';
import 'package:colorplanet/core/theme/app_colors.dart';
import 'package:colorplanet/core/constants/app_constants.dart';
import 'package:colorplanet/features/home/presentation/widgets/nav_item.dart';

class BottomNavSection extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onNavItemSelected;

  // 底部导航图标
  final List<IconData> _navIcons = [
    Icons.book,
    Icons.star,
    Icons.palette,
    Icons.person,
  ];

  BottomNavSection({
    super.key,
    required this.selectedIndex,
    required this.onNavItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        width: 375,
        height: 90,
        decoration: BoxDecoration(
          color: AppColors.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            AppConstants.navLabels.length,
            (index) => NavItem(
              icon: _navIcons[index],
              label: AppConstants.navLabels[index],
              isSelected: index == selectedIndex,
              onTap: () => onNavItemSelected(index),
            ),
          ),
        ),
      ),
    );
  }
}
