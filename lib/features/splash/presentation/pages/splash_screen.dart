import 'package:flutter/material.dart';
import 'package:colorplanet/features/splash/presentation/widgets/splash_content.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashContent(),
    );
  }
}
