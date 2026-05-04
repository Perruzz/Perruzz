# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter web portfolio app for Andrea Perozzo with a manga/comic aesthetic. It is a single-page scrollable site deployed to GitHub Pages via GitHub Actions. The visual style is strictly black-and-white with thick borders, screentone dot patterns, and anime-style typography.

## Common Commands

- `flutter pub get` — Install dependencies.
- `flutter run -d chrome` — Run locally in Chrome.
- `flutter build web --release` — Build for web.
- `flutter test` — Run widget tests.
- `flutter analyze` — Run static analysis.

## Architecture

The app is a single `MaterialApp` with one `HomeScreen`. The screen is a `CustomScrollView` containing a flat list of sections wrapped in `SliverToBoxAdapter`. There is no routing or state management library.

### Scroll System

`HomeScreen` owns a `ScrollController` whose offset is published via a custom `InheritedWidget`, `ScrollOffsetProvider` (`lib/widgets/scroll_offset_provider.dart`). Widgets that need scroll-driven effects (e.g. parallax) read this notifier with `ScrollOffsetProvider.of(context)` and attach an `AnimatedBuilder`.

### Visual Building Blocks

- **`MangaPanel`** (`lib/widgets/manga_panel.dart`) — The primary content container. Provides thick black borders, optional `screentone` dot background via `ScreentoneBackground`, and optional `inverted` colors. Most section content lives inside a `MangaPanel`.
- **`ScrollReveal`** (`lib/widgets/scroll_reveal.dart`) — Wraps widgets in entrance animations (translate, scale, rotate, fade) triggered by `visibility_detector` when >15% visible. Most section items are wrapped in this.
- **`SectionTitle`** (`lib/widgets/section_title.dart`) — Black banner with a left white border and optional chapter badge.
- **`MangaPageBreak`** (`lib/widgets/page_break.dart`) — Horizontal divider with an optional `CH.xx` chapter tag or an `END` tag.

### Sections

Each section in `lib/sections/` is a self-contained `StatelessWidget` that defines its own data and layout. Sections follow a consistent pattern: a `SectionTitle`, a list of items wrapped in `ScrollReveal` + `MangaPanel`, and responsive layout via `MediaQuery.of(context).size.width < 800`.

- `CoverSection` — Hero with profile picture, name, role, and contact pills.
- `AboutSection` — Bio text and trait badges.
- `SkillsSection` — Categorized skill chips in grouped panels.
- `ExperienceSection` — Timeline cards. On desktop, cards alternate left/right alignment via `index % 2`.
- `ProjectsSection` — Grid of project cards linking to GitHub via `url_launcher`.
- `EducationSection` — Alternating inverted/normal panels for degrees.
- `ContactSection` — CTA with email/phone actions and social links.

### Theme

`lib/theme/app_theme.dart` defines `MangaTheme`, a hardcoded black-and-white palette using `GoogleFonts.bebasNeue` for display type and `GoogleFonts.oswald`/`GoogleFonts.inter` for body text. Do not add new colors outside of black, white, grey, and lightGrey.

## Deployment

`.github/workflows/deploy.yml` builds the web artifact with `--base-href /${{ github.event.repository.name }}/` and deploys to GitHub Pages on every push to `main`.

## Notes

- The default `test/widget_test.dart` is currently broken: it references `MyApp` instead of `PortfolioApp`.
- Mobile/desktop breakpoint is consistently `800` pixels of width.
- The app uses `url_launcher` for external links; always use `LaunchMode.externalApplication` for web URLs.
