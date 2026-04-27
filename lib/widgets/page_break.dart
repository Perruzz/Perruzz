import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class MangaPageBreak extends StatelessWidget {
  final String? chapter;
  final bool isEnd;

  const MangaPageBreak({
    super.key,
    this.chapter,
    this.isEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isEnd) {
      return Container(
        height: 80,
        color: MangaTheme.black,
        child: Center(
          child: Text(
            'END',
            style: GoogleFonts.bebasNeue(
              fontSize: 32,
              color: MangaTheme.white,
              letterSpacing: 8,
            ),
          ),
        ),
      );
    }

    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Container(height: 3, color: MangaTheme.black),
          ),
          if (chapter != null)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: MangaTheme.black,
                border: Border.all(color: MangaTheme.black, width: 3),
              ),
              child: Text(
                'CH.$chapter',
                style: GoogleFonts.bebasNeue(
                  fontSize: 18,
                  color: MangaTheme.white,
                  letterSpacing: 2,
                ),
              ),
            ),
          Expanded(
            child: Container(height: 3, color: MangaTheme.black),
          ),
        ],
      ),
    );
  }
}
