import 'dart:async';
import 'package:flutter/material.dart';
import 'package:colorplanet/core/theme/app_colors.dart';

class SplashProgress extends StatefulWidget {
  final VoidCallback onLoadingComplete;

  const SplashProgress({
    super.key,
    required this.onLoadingComplete,
  });

  @override
  State<SplashProgress> createState() => _SplashProgressState();
}

class _SplashProgressState extends State<SplashProgress> {
  // 加载进度
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    // 模拟加载进度
    _startLoading();
  }

  // 模拟加载过程
  void _startLoading() {
    // 使用定时器每100毫秒更新一次进度
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        // 每次增加2%的进度
        _progress += 0.02;

        // 当进度达到100%时，跳转到首页
        if (_progress >= 1.0) {
          timer.cancel();
          // 延迟200毫秒后跳转，让用户看到100%的状态
          Timer(const Duration(milliseconds: 200), () {
            widget.onLoadingComplete();
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          // 自定义进度条
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 10,
              child: LinearProgressIndicator(
                value: _progress,
                backgroundColor: AppColors.progressBackground,
                color: AppColors.progressForeground,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // 显示进度百分比
          Text(
            '${(_progress * 100).toInt()}%',
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
              fontFamily: 'PingFang SC',
            ),
          ),
        ],
      ),
    );
  }
}
