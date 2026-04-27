import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'screentone_background.dart';

class MangaPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double borderWidth;
  final bool screentone;
  final bool inverted;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final double margin;

  const MangaPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.borderWidth = 3,
    this.screentone = false,
    this.inverted = false,
    this.width,
    this.height,
    this.backgroundColor,
    this.margin = 8,
  });

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? (inverted ? MangaTheme.black : MangaTheme.white);

    Widget content = Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        color: bg,
        border: Border.all(color: MangaTheme.black, width: borderWidth),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );

    if (screentone) {
      content = ClipRect(
        child: ScreentoneBackground(
          inverted: inverted,
          child: content,
        ),
      );
    }

    return content;
  }
}