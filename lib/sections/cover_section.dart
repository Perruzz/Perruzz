import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CoverSection extends StatelessWidget {
  const CoverSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      color: MangaTheme.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Container(
            width: isMobile ? 140 : 180,
            height: isMobile ? 140 : 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: MangaTheme.black, width: 4),
              image: const DecorationImage(
                image: AssetImage('assets/profile-pic.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: MangaTheme.black, width: 3),
            ),
            child: Text(
              'VOL. 1',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontSize: isMobile ? 20 : 24,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'ANDREA PEROZZO',
            textAlign: TextAlign.center,
            style: theme.textTheme.displayLarge?.copyWith(
              fontSize: isMobile ? 56 : 100,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: MangaTheme.black,
            ),
            child: Text(
              'SOFTWARE DEVELOPER',
              style: theme.textTheme.titleLarge?.copyWith(
                color: MangaTheme.white,
                fontSize: isMobile ? 18 : 24,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'INDUSTRIAL ELECTRONICS • COMPUTER SCIENCE',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              letterSpacing: 2,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildContactPill(Icons.phone, '+39 3493304341'),
              const SizedBox(width: 12),
              _buildContactPill(Icons.email, 'perozzoandrea3@gmail.com'),
            ],
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget _buildContactPill(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: MangaTheme.black, width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: MangaTheme.black),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: MangaTheme.black,
            ),
          ),
        ],
      ),
    );
  }
}
