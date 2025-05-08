import 'package:flutter/material.dart';
import 'package:colorplanet/core/theme/app_colors.dart';

/// 渐变背景容器组件
/// 
/// 一个自定义的容器组件，提供从上到下的渐变背景效果。
/// 可以通过width和height参数控制容器大小，
/// 支持放置任意子组件。
/// 
/// 使用AppColors.primary作为渐变的主色调。
class GradientContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;

  const GradientContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(0),
          ],
        ),
      ),
      child: child,
    );
  }
}
