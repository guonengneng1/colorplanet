import 'package:flutter/material.dart';
import 'package:colorplanet/core/theme/app_colors.dart';
import 'package:colorplanet/core/constants/app_constants.dart';
import 'package:colorplanet/features/home/presentation/widgets/nav_item.dart';

/// BottomNavSection类
///
/// 底部导航栏组件
/// 提供应用的主要导航功能，包含Library、Selection、My Art和Profile四个选项
/// 支持点击切换不同页面，并显示当前选中状态
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
