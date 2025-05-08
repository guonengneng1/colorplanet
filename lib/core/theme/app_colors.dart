import 'package:flutter/material.dart';

/// 应用程序主题颜色管理类
/// 
/// 定义了应用程序中使用的所有主题颜色，包括：
/// - 主色调
/// - 背景色
/// - 文本颜色
/// - 进度条颜色
/// 
/// 这些颜色用于保持应用程序UI风格的一致性
class AppColors {
  // 主色调
  static const Color primary = Color(0xFF2487FF);

  // 背景色
  static const Color background = Colors.white;

  // 文本颜色
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;

  // 进度条颜色
  static const Color progressBackground = Colors.white30;
  static const Color progressForeground = Colors.white;
}
