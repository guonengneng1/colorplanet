import 'package:flutter/material.dart';

/// 涂色图片数据模型类
/// 
/// 用于表示一个可供涂色的图片，包含：
/// - 图片的占位符颜色
/// - 图片的URL地址（可选）
/// 
/// 主要用于管理涂色功能中的图片资源
class ColoringImageModel {
  final Color placeholderColor;
  final String? imageUrl;

  ColoringImageModel({
    required this.placeholderColor,
    this.imageUrl,
  });
}
