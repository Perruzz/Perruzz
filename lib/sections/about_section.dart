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
                    'Driven by an insatiable curiosity and a competitive mindset, I am constantly seeking new knowledge and challenges across technical and scientific domains. I thrive in environments that push me to learn, adapt, and improve. I believe deeply in the value of social relationships, constructive debate, and continuous personal growth.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Outside of work, I stay active through swimming and fitness, enjoy chess as a mental challenge, and apply an analytical mindset to geopolitics. I am deeply fascinated by the sciences, particularly medicine and chemistry, and I feed a broad curiosity through reading manga, traveling, and actively managing my personal finances and investment portfolio with a strong passion for markets and long-term wealth building.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildTraitBadge('CURIOSITY'),
                      _buildTraitBadge('COMPETITIVENESS'),
                      _buildTraitBadge('ADAPTABILITY'),
                      _buildTraitBadge('CONTINUOUS GROWTH'),
                      _buildTraitBadge('SOCIAL RELATIONSHIPS'),
                      _buildTraitBadge('ANALYTICAL'),
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
