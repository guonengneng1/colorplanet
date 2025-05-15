import 'package:flutter/material.dart';
import 'package:colorplanet/features/splash/presentation/widgets/splash_content.dart';

/// SplashScreen类
///
/// 应用启动时的加载页面
/// 显示应用的品牌信息和加载进度，增强用户体验
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashContent(),
    );
  }
}
