import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class FocusLines extends StatelessWidget {
  final double height;
  final double lineCount;
  final double rotation;

  const FocusLines({
    super.key,
    this.height = 80,
    this.lineCount = 24,
    this.rotation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Transform.rotate(
        angle: rotation,
        child: CustomPaint(
          size: Size(double.infinity, height),
          painter: _FocusLinesPainter(lineCount: lineCount),
        ),
      ),
    );
  }
}

class _FocusLinesPainter extends CustomPainter {
  final double lineCount;

  _FocusLinesPainter({required this.lineCount});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = MangaTheme.black
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width > size.height ? size.width : size.height;

    for (int i = 0; i < lineCount; i++) {
      final angle = (i / lineCount) * 2 * 3.14159;
      final startRadius = maxRadius * 0.15;
      final endRadius = maxRadius * 0.55;

      final start = Offset(
        center.dx + startRadius * cos(angle),
        center.dy + startRadius * sin(angle),
      );
      final end = Offset(
        center.dx + endRadius * cos(angle),
        center.dy + endRadius * sin(angle),
      );

      canvas.drawLine(start, end, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
