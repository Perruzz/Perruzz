import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/manga_panel.dart';
import '../widgets/scroll_reveal.dart';
import '../widgets/section_title.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  final List<Map<String, dynamic>> experiences = const [
    {
      'role': 'Software Developer',
      'company': 'Wavelop Srl',
      'location': 'Treviso',
      'period': 'Jan 2026 - Present',
      'description': 'Full-stack development of high-performance web platforms.',
      'bullets': [
        'Engineered responsive, type-safe UIs with Next.js, React, Astro, TypeScript.',
        'Architected scalable backends with Strapi headless CMS.',
        'Implemented Zod validation and comprehensive testing strategies.',
      ],
    },
    {
      'role': 'Network Security Engineer Intern',
      'company': 'Kirey Srl',
      'location': 'Padova',
      'period': 'May 2025 - July 2025',
      'description': 'Web application security and advanced traffic analysis.',
      'bullets': [
        'Tuned F5 BIG-IP WAF policies to mitigate OWASP Top 10 vulnerabilities and secure application endpoints.',
        'Conducted deep traffic analysis and behavioral detection using Burp Suite.',
        'Simulated real-world attack environments to validate security hardening and incident response readiness.',
      ],
    },
    {
      'role': 'Production Scheduler / Purchasing',
      'company': 'Megius Spa',
      'location': 'Mestrino',
      'period': 'July 2020 - Sept 2021',
      'description': 'Production planning and warehouse operations.',
      'bullets': [
        'Optimized supplier relationships through MRP systems.',
        'Managed logistics documentation and inventory corrections.',
      ],
    },
    {
      'role': 'Production Technician',
      'company': 'NextSight Srl',
      'location': 'Limena',
      'period': 'July 2019 - July 2020',
      'description': 'Assembly, calibration, and QA of automated fundus cameras.',
      'bullets': [
        'Led hardware assembly and precision calibration of optical devices.',
        'Authored troubleshooting and assembly manuals.',
        'Delivered technical training to French production teams.',
      ],
    },
    {
      'role': 'Electrician',
      'company': 'Elettroquattro Srl',
      'location': 'Veggiano',
      'period': 'Jan 2018 - Mar 2018',
      'description': 'Industrial electrical installations and maintenance.',
      'bullets': [
        'Installed, wired, and maintained industrial electrical systems and control panels.',
        'Performed electrical measurements and fault diagnosis on industrial machinery.',
        'Assisted in assembling switchboards and wiring electrical circuits under supervision.',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    return Column(
      children: [
        const SectionTitle(title: 'Battle Log', chapterNumber: '03'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: experiences.asMap().entries.map((entry) {
              final index = entry.key;
              final exp = entry.value;
              final isLeft = index % 2 == 0;

              return ScrollReveal(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                offset: isMobile ? 50 : (isLeft ? -80 : 80),
                delay: Duration(milliseconds: index * 150),
                scaleFrom: 0.9,
                scaleTo: 1.0,
                rotateFrom: isLeft ? -0.015 : 0.015,
                rotateTo: 0.0,
                duration: const Duration(milliseconds: 800),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  alignment: isMobile
                      ? Alignment.center
                      : (isLeft ? Alignment.centerLeft : Alignment.centerRight),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: isMobile ? double.infinity : width * 0.75,
                    ),
                    child: _buildCard(context, exp),
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

  Widget _buildCard(BuildContext context, Map<String, dynamic> exp) {
    return MangaPanel(
      screentone: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  exp['role']!.toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: MediaQuery.of(context).size.width < 800 ? 18 : 22,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: MangaTheme.black, width: 2),
                ),
                child: Text(
                  exp['period']!,
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '${exp['company']} — ${exp['location']}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(exp['description'], style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 8),
          ...exp['bullets'].map<Widget>((b) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('▸ ', style: TextStyle(fontWeight: FontWeight.w900)),
                Expanded(child: Text(b, style: Theme.of(context).textTheme.bodyMedium)),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
