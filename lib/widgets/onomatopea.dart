import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class Onomatopea extends StatelessWidget {
  final String text;
  final double fontSize;
  final double rotation;
  final bool inverted;

  const Onomatopea({
    super.key,
    required this.text,
    this.fontSize = 48,
    this.rotation = -0.15,
    this.inverted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotation,
      child: Stack(
        children: [
          Text(
            text,
            style: GoogleFonts.bebasNeue(
              fontSize: fontSize,
              color: inverted ? MangaTheme.white : MangaTheme.black,
              letterSpacing: 3,
              height: 1,
            ),
          ),
          Positioned(
            top: 1.5,
            left: 1.5,
            child: Text(
              text,
              style: GoogleFonts.bebasNeue(
                fontSize: fontSize,
                color: inverted ? MangaTheme.black : MangaTheme.white,
                letterSpacing: 3,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
