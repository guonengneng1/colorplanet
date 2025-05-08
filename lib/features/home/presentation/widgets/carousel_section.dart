import 'dart:async';
import 'package:flutter/material.dart';
import 'package:colorplanet/core/theme/app_colors.dart';

class CarouselSection extends StatefulWidget {
  const CarouselSection({super.key});

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  // 当前轮播图索引
  int _currentCarouselIndex = 0;

  // 轮播图计时器
  Timer? _carouselTimer;

  // 模拟轮播图图片
  final List<Color> _carouselColors = [
    Colors.blue.shade300,
    Colors.pink.shade300,
    Colors.purple.shade300,
    Colors.orange.shade300,
    Colors.green.shade300,
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
    return Container(
      width: 375,
      height: 180,
      decoration: BoxDecoration(
        // 使用渐变背景
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(0),
          ],
        ),
      ),
      child: Stack(
        children: [
          // 轮播图内容
          _buildCarouselContent(),

          // 轮播图指示器
          _buildCarouselIndicators(),
        ],
      ),
    );
  }

  // 构建轮播图内容
  Widget _buildCarouselContent() {
    return AnimatedSwitcher(
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
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'PingFang SC',
            ),
          ),
        ),
      ),
    );
  }

  // 构建轮播图指示器
  Widget _buildCarouselIndicators() {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _carouselColors.length,
          (index) => _buildIndicatorDot(index),
        ),
      ),
    );
  }

  // 构建指示器点
  Widget _buildIndicatorDot(int index) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentCarouselIndex == index
            ? AppColors.textPrimary
            : AppColors.textPrimary.withOpacity(0.5),
      ),
    );
  }
}
