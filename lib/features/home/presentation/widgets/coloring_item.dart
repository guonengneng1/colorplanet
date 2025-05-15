import 'package:flutter/material.dart';

/// ColoringItem类
///
/// 单个涂色图片项组件
/// 展示一个可供涂色的图片，目前使用颜色块占位
/// 未来可扩展为显示真实图片，支持点击进入涂色页面
class ColoringItem extends StatelessWidget {
  final Color color;

  const ColoringItem({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 171,
      height: 171,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 150,
            height: 150,
            color: color,
            child: Center(
              child: Icon(
                Icons.image,
                size: 50,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
