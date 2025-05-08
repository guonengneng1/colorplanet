import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page.dart';

/// 应用启动页面
/// 
/// 主要功能：
/// - 显示应用启动进度
/// - 提供平滑的加载动画
/// - 完成加载后自动跳转到主页
/// 
/// 使用StatefulWidget管理加载状态和进度
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 使用蓝色渐变背景
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2487FF),
              Colors.white,
            ],
          ),
        ),
        // 居中显示内容
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 应用图标
              const Icon(
                Icons.palette,
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              // 应用名称
              const Text(
                '涂色星球',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'PingFang SC',
                ),
              ),
              const SizedBox(height: 50),
              // 进度条
              Padding(
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
                          backgroundColor: Colors.white.withOpacity(0.3),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // 显示进度百分比
                    Text(
                      '${(_progress * 100).toInt()}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'PingFang SC',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
