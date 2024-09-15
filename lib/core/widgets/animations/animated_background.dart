import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';

class AnimatedBackgroundWidget extends StatefulWidget {
  const AnimatedBackgroundWidget({super.key, required this.child});
  final Widget child;
  @override
  State<AnimatedBackgroundWidget> createState() => _AnimatedBackgroundWidgetState();
}

class _AnimatedBackgroundWidgetState extends State<AnimatedBackgroundWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      vsync: this,
      behaviour: RandomParticleBehaviour(
        options: ParticleOptions(
          image: Image.asset(AppImages.appLogo),
          // baseColor: context.themeColors.primary.withOpacity(0.5),
          spawnOpacity: 0.0,
          minOpacity: 0.01,
          maxOpacity: 0.2,
          spawnMinSpeed: 30.0,
          spawnMaxSpeed: 50.0,
          spawnMinRadius: 10,
          spawnMaxRadius: 20.0,
          particleCount: 40,
        ),
      ),
      child: widget.child,
    );
  }
}
