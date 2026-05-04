import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../widgets/manga_panel.dart';
import '../widgets/scroll_reveal.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchEmail() async {
    final uri = Uri.parse('mailto:perozzoandrea3@gmail.com');
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  Future<void> _launchPhone() async {
    final uri = Uri.parse('tel:+393493304341');
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  Future<void> _launchCv() async {
    final uri = Uri.parse('https://perruzz.github.io/Perruzz/andrea_perozzo_cv.pdf');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Column(
      children: [
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ScrollReveal(
            scaleFrom: 0.9,
            scaleTo: 1.0,
            duration: const Duration(milliseconds: 900),
            child: MangaPanel(
              inverted: true,
              borderWidth: 4,
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Text(
                    'TO BE CONTINUED...',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: MangaTheme.white,
                      fontSize: isMobile ? 40 : 56,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Want to start the next chapter together?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: MangaTheme.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ScrollReveal(
                    delay: const Duration(milliseconds: 100),
                    scaleFrom: 0.95,
                    scaleTo: 1.0,
                    child: GestureDetector(
                      onTap: _launchCv,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: MangaTheme.white,
                          border: Border.all(color: MangaTheme.white, width: 3),
                        ),
                        child: const Text(
                          'DOWNLOAD CV',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: MangaTheme.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ScrollReveal(
                    delay: const Duration(milliseconds: 150),
                    scaleFrom: 0.95,
                    scaleTo: 1.0,
                    child: GestureDetector(
                      onTap: _launchEmail,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: MangaTheme.white, width: 3),
                        ),
                        child: const Text(
                          'perozzoandrea3@gmail.com',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: MangaTheme.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ScrollReveal(
                    delay: const Duration(milliseconds: 300),
                    scaleFrom: 0.95,
                    scaleTo: 1.0,
                    child: GestureDetector(
                      onTap: _launchPhone,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: MangaTheme.white,
                          border: Border.all(color: MangaTheme.white, width: 3),
                        ),
                        child: const Text(
                          '+39 349 330 4341',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: MangaTheme.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialPill('GitHub', 'https://github.com/Perruzz'),
                      const SizedBox(width: 12),
                      _buildSocialPill('LinkedIn', 'https://linkedin.com/in/andrea-perozzo'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: MangaTheme.black, width: 3)),
          ),
          child: const Text(
            '© 2026 ANDREA PEROZZO — ALL RIGHTS RESERVED',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 12,
              letterSpacing: 2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialPill(String label, String url) {
    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: MangaTheme.white, width: 2),
        ),
        child: Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: MangaTheme.white,
            fontWeight: FontWeight.w800,
            fontSize: 12,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
