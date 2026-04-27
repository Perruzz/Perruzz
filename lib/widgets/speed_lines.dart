import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SpeedLinesDivider extends StatelessWidget {
  final double height;
  final double lineWidth;

  const SpeedLinesDivider({
    super.key,
    this.height = 40,
    this.lineWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomPaint(
        size: Size(double.infinity, height),
        painter: _SpeedLinesPainter(lineWidth: lineWidth),
      ),
    );
  }
}

class _SpeedLinesPainter extends CustomPainter {
  final double lineWidth;

  _SpeedLinesPainter({required this.lineWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = MangaTheme.black
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke;

    const count = 12;
    final spacing = size.width / count;

    for (int i = 0; i <= count; i++) {
      final x = i * spacing;
      final path = Path();
      path.moveTo(x, size.height);
      path.quadraticBezierTo(x + spacing * 0.3, size.height * 0.5, x - spacing * 0.2, 0);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
