import 'package:flutter/material.dart';
import 'scroll_offset_provider.dart';

class ParallaxLayer extends StatelessWidget {
  final Widget child;
  final double speed;
  final double? horizontalSpeed;

  const ParallaxLayer({
    super.key,
    required this.child,
    this.speed = -0.15,
    this.horizontalSpeed,
  });

  @override
  Widget build(BuildContext context) {
    final notifier = ScrollOffsetProvider.of(context);
    return AnimatedBuilder(
      animation: notifier,
      builder: (context, child) {
        final dx = horizontalSpeed != null ? notifier.value * horizontalSpeed! : 0.0;
        final dy = notifier.value * speed;
        return Transform.translate(
          offset: Offset(dx, dy),
          child: child,
        );
      },
      child: child,
    );
  }
}
