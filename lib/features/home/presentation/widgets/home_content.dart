import 'package:flutter/material.dart';
import 'package:colorplanet/features/home/presentation/widgets/carousel_section.dart';
import 'package:colorplanet/features/home/presentation/widgets/category_section.dart';
import 'package:colorplanet/features/home/presentation/widgets/coloring_grid_section.dart';
import 'package:colorplanet/features/home/presentation/widgets/bottom_nav_section.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  // 当前选中的分类索引
  int _selectedCategoryIndex = 0;

  // 当前选中的导航项
  int _selectedNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        // 主体内容区域
        SingleChildScrollView(
          child: Column(
            children: [
              // 1. 顶部轮播图区域
              const CarouselSection(),

              // 2. 分类选择区域
              CategorySection(
                selectedIndex: _selectedCategoryIndex,
                onCategorySelected: (index) {
                  setState(() {
                    _selectedCategoryIndex = index;
                  });
                },
              ),

              // 3. 涂色图片展示区域
              ColoringGridSection(screenWidth: screenWidth),

              // 为底部导航栏预留空间
              const SizedBox(height: 90),
            ],
          ),
        ),

        // 4. 底部导航栏
        BottomNavSection(
          selectedIndex: _selectedNavIndex,
          onNavItemSelected: (index) {
            setState(() {
              _selectedNavIndex = index;
            });
          },
        ),
      ],
    );
  }
}
