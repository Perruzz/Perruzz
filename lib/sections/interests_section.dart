import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/manga_panel.dart';
import '../widgets/scroll_reveal.dart';
import '../widgets/section_title.dart';

class InterestsSection extends StatelessWidget {
  const InterestsSection({super.key});

  final List<Map<String, String>> interests = const [
    {
      'title': 'Continuous Learning',
      'desc': 'I am a strong believer in the value of social relationships and never-stop-growing mindset.',
    },
    {
      'title': 'Swimming & Fitness',
      'desc': 'Staying active through swimming and fitness to keep mind and body sharp.',
    },
    {
      'title': 'Chess',
      'desc': 'Mental challenge and strategic thinking sharpened over the board.',
    },
    {
      'title': 'Geopolitics',
      'desc': 'Applying an analytical mindset to study global affairs and international dynamics.',
    },
    {
      'title': 'Sciences',
      'desc': 'Deeply fascinated by medicine and chemistry — organic, inorganic, and biochemistry.',
    },
    {
      'title': 'Manga & Reading',
      'desc': 'Berserk is my absolute favorite. A broad curiosity fed through reading and traveling.',
    },
    {
      'title': 'Personal Finance',
      'desc': 'Managing and studying personal finances with the same rigor as code architecture.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Column(
      children: [
        const SectionTitle(title: 'Side Stories', chapterNumber: '06'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              childAspectRatio: isMobile ? 2.6 : 2.0,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: interests.length,
            itemBuilder: (context, index) {
              final item = interests[index];
              return ScrollReveal(
                delay: Duration(milliseconds: index * 100),
                scaleFrom: 0.88,
                scaleTo: 1.0,
                rotateFrom: index.isEven ? 0.01 : -0.01,
                rotateTo: 0.0,
                duration: const Duration(milliseconds: 700),
                child: MangaPanel(
                  screentone: true,
                  margin: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!.toUpperCase(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Text(
                          item['desc']!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
