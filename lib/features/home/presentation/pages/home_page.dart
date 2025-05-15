import 'package:flutter/material.dart';
import 'package:colorplanet/features/home/presentation/widgets/home_content.dart';

/// HomePage类
///
/// 应用的主页面
/// 用户完成加载后进入的首页，展示应用的主要功能和内容
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeContent(),
    );
  }
}
