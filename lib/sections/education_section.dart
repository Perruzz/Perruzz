import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../widgets/manga_panel.dart';
import '../widgets/scroll_reveal.dart';
import '../widgets/section_title.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  final List<Map<String, String>> education = const [
    {
      'school': 'University of Padua',
      'period': '2025 - 2027 (Expected)',
      'degree': 'Master\'s degree in Computer Science',
      'note': '',
    },
    {
      'school': 'University of Padua',
      'period': '2022 - 2025',
      'degree': 'Bachelor\'s degree in Computer Science',
      'note': 'Grade: 98/110',
    },
    {
      'school': 'University of Padua',
      'period': '2021 - 2022 (Interrupted)',
      'degree': 'Biomedical Engineering',
      'note': 'Incomplete',
    },
    {
      'school': 'IPSIA E. Bernardi',
      'period': '2014 - 2019',
      'degree': 'Diploma in Industrial Electrical Systems',
      'note': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(title: 'Training Arc', chapterNumber: '05'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: education.asMap().entries.map((entry) {
              final index = entry.key;
              final edu = entry.value;
              return ScrollReveal(
                delay: Duration(milliseconds: index * 120),
                scaleFrom: 0.9,
                scaleTo: 1.0,
                rotateFrom: index.isEven ? -0.01 : 0.01,
                rotateTo: 0.0,
                duration: const Duration(milliseconds: 800),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: MangaPanel(
                    screentone: index % 2 == 0,
                    inverted: index % 2 != 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                edu['degree']!.toUpperCase(),
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: index % 2 != 0 ? MangaTheme.white : MangaTheme.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: index % 2 != 0 ? MangaTheme.white : MangaTheme.black,
                                  width: 2,
                                ),
                              ),
                              child: Text(
                                edu['period']!,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: index % 2 != 0 ? MangaTheme.white : MangaTheme.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          edu['school']!,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: index % 2 != 0 ? MangaTheme.white.withOpacity(0.9) : MangaTheme.grey,
                          ),
                        ),
                        if (edu['note']!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: edu['note']!.startsWith('http')
                                ? GestureDetector(
                                    onTap: () async {
                                      final uri = Uri.parse(edu['note']!);
                                      if (await canLaunchUrl(uri)) {
                                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                                      }
                                    },
                                    child: Text(
                                      edu['note']!,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: index % 2 != 0 ? MangaTheme.white.withOpacity(0.7) : MangaTheme.lightGrey,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  )
                                : Text(
                                    edu['note']!,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: index % 2 != 0 ? MangaTheme.white.withOpacity(0.7) : MangaTheme.lightGrey,
                                    ),
                                  ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
