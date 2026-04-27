import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? chapterNumber;

  const SectionTitle({
    super.key,
    required this.title,
    this.chapterNumber,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: MangaTheme.black,
        border: Border(
          left: BorderSide(color: MangaTheme.white, width: 6),
        ),
      ),
      child: Row(
        children: [
          if (chapterNumber != null)
            Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: MangaTheme.white, width: 2),
              ),
              child: Text(
                'CH.$chapterNumber',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: MangaTheme.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          Expanded(
            child: Text(
              title.toUpperCase(),
              style: theme.textTheme.displaySmall?.copyWith(
                color: MangaTheme.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
