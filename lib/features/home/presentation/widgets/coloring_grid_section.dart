import 'package:flutter/material.dart';
import 'package:colorplanet/features/home/presentation/widgets/coloring_item.dart';

class ColoringGridSection extends StatelessWidget {
  final double screenWidth;

  // 模拟涂色图片
  final List<Color> _coloringImages = [
    Colors.grey.shade200,
    Colors.grey.shade300,
    Colors.grey.shade200,
    Colors.grey.shade300,
    Colors.grey.shade200,
    Colors.grey.shade300,
    Colors.grey.shade200,
    Colors.grey.shade300,
  ];

  ColoringGridSection({
    super.key,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        // 禁用GridView的滚动，因为外层已有滚动
        physics: const NeverScrollableScrollPhysics(),
        // 设置网格为固定高度
        shrinkWrap: true,
        // 每行2个
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1, // 宽高比为1:1
          crossAxisSpacing: 10, // 横向间距
          mainAxisSpacing: 10, // 纵向间距
        ),
        itemCount: _coloringImages.length,
        itemBuilder: (context, index) => ColoringItem(
          color: _coloringImages[index],
        ),
      ),
    );
  }
}
