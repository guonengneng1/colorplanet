import 'package:flutter/material.dart';
import 'package:colorplanet/core/theme/app_colors.dart';
import 'package:colorplanet/core/constants/app_constants.dart';
import 'package:colorplanet/features/splash/presentation/widgets/splash_progress.dart';
import 'package:colorplanet/features/home/presentation/pages/home_page.dart';

/// SplashContent类
///
/// 加载页面的主体内容组件
/// 包含应用图标、应用名称和加载进度条，提供从启动页到首页的过渡动画
class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary,
            AppColors.background,
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 应用图标
            const Icon(
              Icons.palette,
              size: 80,
              color: AppColors.textPrimary,
            ),
            const SizedBox(height: 20),
            // 应用名称
            Text(
              AppConstants.appName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
                fontFamily: 'PingFang SC',
              ),
            ),
            const SizedBox(height: 50),
            // 进度条
            SplashProgress(
              onLoadingComplete: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
