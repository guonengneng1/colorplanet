import 'package:flutter/material.dart';

/// ColoringImageModel类
///
/// 涂色图片数据模型
/// 用于存储和管理涂色图片数据，包括占位色和图片URL
/// 未来可扩展添加图片ID、难度等级、分类等信息
class ColoringImageModel {
  final Color placeholderColor;
  final String? imageUrl;

  ColoringImageModel({
    required this.placeholderColor,
    this.imageUrl,
  });
}
