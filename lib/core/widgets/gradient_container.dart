import 'package:flutter/material.dart';
import 'package:colorplanet/core/theme/app_colors.dart';

/// GradientContainer类
///
/// 通用的渐变背景容器组件
/// 提供一个带有渐变背景的容器，可复用于应用中多个需要渐变背景的地方
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
