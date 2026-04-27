import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ScreentoneBackground extends StatelessWidget {
  final Widget child;
  final double dotSize;
  final double spacing;
  final bool inverted;

  const ScreentoneBackground({
    super.key,
    required this.child,
    this.dotSize = 2.5,
    this.spacing = 6,
    this.inverted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: _ScreentonePainter(
              dotSize: dotSize,
              spacing: spacing,
              inverted: inverted,
            ),
          ),
        ),
        child,
      ],
    );
  }
}

class _ScreentonePainter extends CustomPainter {
  final double dotSize;
  final double spacing;
  final bool inverted;

  _ScreentonePainter({
    required this.dotSize,
    required this.spacing,
    required this.inverted,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = inverted ? MangaTheme.white.withOpacity(0.15) : MangaTheme.black.withOpacity(0.08)
      ..style = PaintingStyle.fill;

    for (double y = 0; y < size.height; y += spacing) {
      final offsetX = ((y ~/ spacing) % 2 == 0) ? 0.0 : spacing / 2;
      for (double x = -spacing; x < size.width + spacing; x += spacing) {
        canvas.drawCircle(Offset(x + offsetX, y), dotSize / 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}