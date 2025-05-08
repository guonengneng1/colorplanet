import 'dart:async';
import 'package:flutter/material.dart';

/// 应用程序主页面
/// 
/// 主要功能包括：
/// - 图片轮播展示
/// - 分类内容浏览
/// - 底部导航栏
/// 
/// 使用StatefulWidget管理页面状态，包括：
/// - 轮播图当前索引
/// - 选中的分类
/// - 当前导航项
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 当前轮播图索引
  int _currentCarouselIndex = 0;

  // 当前选中的分类索引
  int _selectedCategoryIndex = 0;

  // 当前选中的导航项
  int _selectedNavIndex = 0;

  // 轮播图计时器
  Timer? _carouselTimer;

  // 分类列表
  final List<String> _categories = [
    'For you',
    'Oil Painting',
    'Mandala',
    'Fashion',
    'Vehicles',
    'Interiors',
    'Simple',
    'Buildings',
    'Scenery',
    'Flowers',
    'Animals',
    'People',
    'Food',
    'Holidays'
  ];

  // 模拟轮播图图片
  final List<Color> _carouselColors = [
    Colors.blue.shade300,
    Colors.pink.shade300,
    Colors.purple.shade300,
    Colors.orange.shade300,
    Colors.green.shade300,
  ];

  // 模拟涂色图片
  final List<Color> _coloringImages = [
    Colors.grey.shade200,
    Colors.grey.shade300,
    Colors.grey.shade200,
    Colors.grey.shade300,
    Colors.grey.shade200,
    Colors.grey.shade300,
    Colors.grey.shade200,
    Colors.grey.shade300,
  ];

  // 底部导航项
  final List<Map<String, dynamic>> _navItems = [
    {'icon': Icons.book, 'label': 'Library'},
    {'icon': Icons.star, 'label': 'Selection'},
    {'icon': Icons.palette, 'label': 'My Art'},
    {'icon': Icons.person, 'label': 'Profile'},
  ];

  @override
  void initState() {
    super.initState();
    // 启动轮播图自动播放
    _startCarouselTimer();
  }

  @override
  void dispose() {
    // 销毁计时器
    _carouselTimer?.cancel();
    super.dispose();
  }

  // 启动轮播图自动播放
  void _startCarouselTimer() {
    // 每秒切换一次
    _carouselTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        // 循环切换轮播图
        _currentCarouselIndex =
            (_currentCarouselIndex + 1) % _carouselColors.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // 获取屏幕宽度（使用375px标准）
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // 主体内容区域
          SingleChildScrollView(
            child: Column(
              children: [
                // 1. 顶部轮播图区域
                _buildCarousel(),

                // 2. 分类选择区域
                _buildCategoryList(),

                // 3. 涂色图片展示区域
                _buildColoringImages(screenWidth),

                // 为底部导航栏预留空间
                const SizedBox(height: 90),
              ],
            ),
          ),

          // 4. 底部导航栏
          _buildBottomNavBar(),
        ],
      ),
    );
  }

  // 1. 构建顶部轮播图
  Widget _buildCarousel() {
    return Container(
      width: 375,
      height: 180,
      decoration: BoxDecoration(
        // 使用渐变背景
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF2487FF),
            const Color(0xFF2487FF).withOpacity(0),
          ],
        ),
      ),
      child: Stack(
        children: [
          // 轮播图内容
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Container(
              key: ValueKey<int>(_currentCarouselIndex),
              width: double.infinity,
              height: double.infinity,
              color: _carouselColors[_currentCarouselIndex],
              child: Center(
                child: Text(
                  '轮播图 ${_currentCarouselIndex + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PingFang SC',
                  ),
                ),
              ),
            ),
          ),

          // 轮播图指示器
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _carouselColors.length,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentCarouselIndex == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 2. 构建分类列表
  Widget _buildCategoryList() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 21,
      // 使用ListView实现横向滚动
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        // 分隔符
        separatorBuilder: (context, index) => const SizedBox(width: 44),
        itemBuilder: (context, index) {
          // 判断是否是选中项
          final isSelected = index == _selectedCategoryIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                _categories[index],
                style: TextStyle(
                  fontFamily: 'PingFang SC',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? const Color(0xFF2487FF) : Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // 3. 构建涂色图片网格
  Widget _buildColoringImages(double screenWidth) {
    // 计算每个图片的宽度，每行两个，左右各有15px间距，中间有10px间距
    final itemWidth = (screenWidth - 40) / 2;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        // 禁用GridView的滚动，因为外层已有滚动
        physics: const NeverScrollableScrollPhysics(),
        // 设置网格为固定高度
        shrinkWrap: true,
        // 每行2个
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1, // 宽高比为1:1
          crossAxisSpacing: 10, // 横向间距
          mainAxisSpacing: 10, // 纵向间距
        ),
        itemCount: _coloringImages.length,
        itemBuilder: (context, index) {
          return Container(
            width: 171,
            height: 171,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 150,
                  height: 150,
                  color: _coloringImages[index],
                  child: Center(
                    child: Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // 4. 构建底部导航栏
  Widget _buildBottomNavBar() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        width: 375,
        height: 90,
        decoration: BoxDecoration(
          color: const Color(0xFF2487FF),
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
            _navItems.length,
            (index) => _buildNavItem(index),
          ),
        ),
      ),
    );
  }

  // 构建单个导航项
  Widget _buildNavItem(int index) {
    final item = _navItems[index];
    final isSelected = index == _selectedNavIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedNavIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 导航图标
          Container(
            width: 50,
            height: 40,
            alignment: Alignment.center,
            child: Icon(
              item['icon'],
              color: isSelected ? Colors.white : Colors.white.withOpacity(0.7),
              size: 28,
            ),
          ),
          // 导航文字
          Container(
            width: 50,
            alignment: Alignment.center,
            child: Text(
              item['label'],
              style: TextStyle(
                fontFamily: 'PingFang SC',
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color:
                    isSelected ? Colors.white : Colors.white.withOpacity(0.7),
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(1.5),
              ),
            ),
        ],
      ),
    );
  }
}
