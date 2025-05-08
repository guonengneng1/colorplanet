import 'package:flutter/material.dart';
import 'package:colorplanet/core/theme/app_colors.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 导航图标
          Container(
            width: 50,
            height: 40,
            alignment: Alignment.center,
            child: Icon(
              icon,
              color:
                  isSelected ? AppColors.textPrimary : AppColors.textSecondary,
              size: 28,
            ),
          ),
          // 导航文字
          Container(
            width: 50,
            alignment: Alignment.center,
            child: Text(
              label,
              style: TextStyle(
                fontFamily: 'PingFang SC',
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? AppColors.textPrimary
                    : AppColors.textSecondary,
              ),
            ),
          ),
          // 选中状态指示器
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 20,
              height: 3,
              decoration: BoxDecoration(
                color: AppColors.textPrimary,
                borderRadius: BorderRadius.circular(1.5),
              ),
            ),
        ],
      ),
    );
  }
}
