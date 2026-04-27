import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../widgets/manga_panel.dart';
import '../widgets/scroll_reveal.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Map<String, String>> projects = const [
    {
      'title': 'CarSensor',
      'desc': 'Vehicle sensor data visualization in C++/Qt.',
      'url': 'https://github.com/Perruzz/CarSensor',
    },
    {
      'title': 'LuzzattiHospital',
      'desc': 'Hospital relational DB with advanced schema modeling.',
      'url': 'https://github.com/Perruzz/LuzzattiHospital',
    },
    {
      'title': 'Thesis',
      'desc': 'Cybersecurity research with Kirey Srl.',
      'url': 'https://github.com/Perruzz/thesis',
    },
    {
      'title': 'DoFlamingo',
      'desc': 'Decentralized NFT marketplace on Ethereum.',
      'url': 'https://github.com/Giuseppe5000/DoFlamingo',
    },
    {
      'title': 'NearYou',
      'desc': 'Local POI discovery app with Agile methodologies.',
      'url': 'https://github.com/SWEatUNIPD/NearYou',
    },
  ];

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final crossAxisCount = isMobile ? 1 : 2;

    return Column(
      children: [
        const SectionTitle(title: 'Side Quests', chapterNumber: '04'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: isMobile ? 2.2 : 1.8,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final p = projects[index];
              return ScrollReveal(
                delay: Duration(milliseconds: index * 100),
                scaleFrom: 0.88,
                scaleTo: 1.0,
                rotateFrom: index.isEven ? 0.01 : -0.01,
                rotateTo: 0.0,
                duration: const Duration(milliseconds: 700),
                child: GestureDetector(
                  onTap: () => _launch(p['url']!),
                  child: MangaPanel(
                    screentone: true,
                    margin: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                p['title']!.toUpperCase(),
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            const Icon(Icons.open_in_new, size: 18),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Text(
                            p['desc']!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          p['url']!,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
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
