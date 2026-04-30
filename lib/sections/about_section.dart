import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/manga_panel.dart';
import '../widgets/scroll_reveal.dart';
import '../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(title: 'Character Profile', chapterNumber: '01'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ScrollReveal(
            scaleFrom: 0.9,
            scaleTo: 1.0,
            rotateFrom: -0.02,
            rotateTo: 0.0,
            duration: const Duration(milliseconds: 800),
            child: MangaPanel(
              screentone: true,
              borderWidth: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'From industrial electrical systems to network security and full-stack web architecture.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Currently engineering high-performance platforms at Wavelop while pursuing a Master\'s in Computer Science at the University of Padua. I believe in continuous learning, analytical thinking, and the value of building resilient systems.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Beyond the screen, I stay active through swimming and fitness, sharpen my mind over a chessboard, and study geopolitics with the same analytical rigor I apply to systems. I am deeply fascinated by medicine and chemistry, feed a broad curiosity through reading manga, traveling, and managing my personal finances with the same discipline I bring to code architecture. I value social relationships above all and never stop growing.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildTraitBadge('PERSEVERANCE'),
                      _buildTraitBadge('ADAPTABILITY'),
                      _buildTraitBadge('ANALYTICAL'),
                      _buildTraitBadge('TEAM PLAYER'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildTraitBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: MangaTheme.black,
        border: Border.all(color: MangaTheme.black, width: 2),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: MangaTheme.white,
          fontWeight: FontWeight.w800,
          fontSize: 12,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
