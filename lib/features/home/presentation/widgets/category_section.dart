import 'package:flutter/material.dart';
import 'package:colorplanet/core/theme/app_colors.dart';
import 'package:colorplanet/core/constants/app_constants.dart';

class CategorySection extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onCategorySelected;

  const CategorySection({
    super.key,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 21,
      // 使用ListView实现横向滚动
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        scrollDirection: Axis.horizontal,
        itemCount: AppConstants.categories.length,
        // 分隔符
        separatorBuilder: (context, index) => const SizedBox(width: 44),
        itemBuilder: (context, index) => _buildCategoryItem(context, index),
      ),
    );
  }

  // 构建分类项
  Widget _buildCategoryItem(BuildContext context, int index) {
    // 判断是否是选中项
    final isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: () => onCategorySelected(index),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          AppConstants.categories[index],
          style: TextStyle(
            fontFamily: 'PingFang SC',
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: isSelected ? AppColors.primary : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
