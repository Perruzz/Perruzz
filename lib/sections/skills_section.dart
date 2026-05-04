import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/manga_panel.dart';
import '../widgets/scroll_reveal.dart';
import '../widgets/section_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final Map<String, List<String>> skillGroups = const {
    'Backend & Web': [
      'Next.js', 'React', 'Astro', 'HTML', 'CSS', 'JavaScript',
      'TypeScript', 'PHP', 'Node.js', 'Strapi', 'SQL', 'phpMyAdmin',
      'PostgreSQL', 'MongoDB', 'Oracle', 'AWS', 'Docker', 'Flutter', 'Dart',
    ],
    'Security & Infrastructure': [
      'OWASP', 'F5 BIG-IP', 'Burp Suite', 'TCP/IP', 'HTTP',
      'VPN', 'Cryptography', 'Firewall', 'VMware Workstation',
    ],
    'Programming & Frameworks': [
      'C', 'C++', 'Qt', 'Python', 'Java', 'Apache Spark',
    ],
    'Scripting': [
      'Bash scripting', 'Shell automation',
    ],
    'Software Engineering': [
      'Design Patterns', 'System Architecture', 'SOLID principles',
    ],
    'Operating Systems & Tools': [
      'Linux (Debian, Fedora, Arch)', 'Windows', 'macOS',
      'Git', 'GitHub', 'GitLab',
    ],
    'Industrial & Automation': [
      'PLC Programming', 'Electropneumatics',
      'Electrical Schematic Design & Reading', 'Industrial Control Panels',
      'Electrical Measurements & Instrumentation', 'Hardware Assembly & Calibration',
    ],
    'Documentation': [
      'LaTeX', 'Typst',
    ],
    'Chemistry': [
      'Organic Chemistry', 'Inorganic Chemistry', 'Biochemistry',
    ],
    'Industrial Manufacturing': [
      'Diagnostic Troubleshooting', 'Field Service',
      'Technical Manual Writing', 'Technical Training',
      'Production Line Setup & Transfer Support',
    ],
    'Languages': [
      'Italian (Native)', 'English (B2)',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(title: 'Arsenal', chapterNumber: '02'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: skillGroups.entries.map((entry) {
              final index = skillGroups.keys.toList().indexOf(entry.key);
              return ScrollReveal(
                delay: Duration(milliseconds: index * 100),
                scaleFrom: 0.88,
                scaleTo: 1.0,
                rotateFrom: index.isEven ? 0.015 : -0.015,
                rotateTo: 0.0,
                duration: const Duration(milliseconds: 700),
                child: MangaPanel(
                  screentone: true,
                  margin: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: const BoxDecoration(
                          color: MangaTheme.black,
                        ),
                        child: Text(
                          entry.key.toUpperCase(),
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: MangaTheme.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: entry.value.map((skill) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              border: Border.all(color: MangaTheme.black, width: 2),
                            ),
                            child: Text(
                              skill,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
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
