import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../core/router/route_paths.dart';
import '../../core/theme/app_colors.dart';

/// Animated intro screen (spec 3.1). Auto-advances to Home after 2.5s or
/// on tap. The gold ring is a bundled Lottie animation
/// (assets/lottie/splash_gold_ring.json); swap that file for a fuller
/// branded animation whenever one is designed.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
    Future.delayed(const Duration(milliseconds: 2500), _advance);
  }

  void _advance() {
    if (mounted) context.go(RoutePaths.home);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navyDeep,
      body: GestureDetector(
        onTap: _advance,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 160,
                height: 160,
                child: Lottie.asset(
                  'assets/lottie/splash_gold_ring.json',
                  repeat: true,
                ),
              ),
              const SizedBox(height: 8),
              FadeTransition(
                opacity: _fade,
                child: Column(
                  children: [
                    const Text(
                      'David Isaiah Saenz',
                      style: TextStyle(
                        color: AppColors.textPrimaryDark,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Mobile · Game · Backend Developer',
                      style: TextStyle(color: AppColors.gold, fontSize: 14),
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
