import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/scroll_offset_provider.dart';
import '../widgets/page_break.dart';
import '../sections/cover_section.dart';
import '../sections/about_section.dart';
import '../sections/skills_section.dart';
import '../sections/experience_section.dart';
import '../sections/projects_section.dart';
import '../sections/education_section.dart';
import '../sections/contact_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  late final ValueNotifier<double> _scrollNotifier;
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollNotifier = ValueNotifier(0);
    _scrollController.addListener(() {
      _scrollNotifier.value = _scrollController.offset;
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollNotifier.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MangaTheme.white,
      body: ScrollOffsetProvider(
        notifier: _scrollNotifier,
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: const [
                SliverToBoxAdapter(child: CoverSection()),
                SliverToBoxAdapter(child: MangaPageBreak(chapter: '01')),
                SliverToBoxAdapter(child: AboutSection()),
                SliverToBoxAdapter(child: MangaPageBreak(chapter: '02')),
                SliverToBoxAdapter(child: SkillsSection()),
                SliverToBoxAdapter(child: MangaPageBreak(chapter: '03')),
                SliverToBoxAdapter(child: ExperienceSection()),
                SliverToBoxAdapter(child: MangaPageBreak(chapter: '04')),
                SliverToBoxAdapter(child: ProjectsSection()),
                SliverToBoxAdapter(child: MangaPageBreak(chapter: '05')),
                SliverToBoxAdapter(child: EducationSection()),
                SliverToBoxAdapter(child: MangaPageBreak(isEnd: true)),
                SliverToBoxAdapter(child: ContactSection()),
              ],
            ),
            _buildFloatingMenu(),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingMenu() {
    final isScrolled = _scrollOffset > 200;
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      top: isScrolled ? 12 : -60,
      left: 12,
      right: 12,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isScrolled ? 1 : 0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: MangaTheme.white,
            border: Border.all(color: MangaTheme.black, width: 3),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _menuItem('Cover', 0),
                _menuItem('Profile', 600),
                _menuItem('Arsenal', 1200),
                _menuItem('Battle Log', 2200),
                _menuItem('Quests', 3800),
                _menuItem('Training', 5000),
                _menuItem('End', 6000),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuItem(String label, double offset) {
    return GestureDetector(
      onTap: () {
        _scrollController.animateTo(
          offset,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: MangaTheme.black, width: 2),
        ),
        child: Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 12,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
