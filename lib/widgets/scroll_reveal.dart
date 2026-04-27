import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScrollReveal extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Axis direction;
  final double offset;
  final double scaleFrom;
  final double scaleTo;
  final double rotateFrom;
  final double rotateTo;
  final Duration duration;

  const ScrollReveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.direction = Axis.vertical,
    this.offset = 40,
    this.scaleFrom = 0.85,
    this.scaleTo = 1.0,
    this.rotateFrom = 0,
    this.rotateTo = 0,
    this.duration = const Duration(milliseconds: 700),
  });

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (_hasAnimated) return;
    if (info.visibleFraction > 0.15) {
      _hasAnimated = true;
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: widget.key ?? ValueKey(hashCode),
      onVisibilityChanged: _onVisibilityChanged,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final value = _animation.value;
          final dx = widget.direction == Axis.horizontal
              ? widget.offset * (1 - value)
              : 0.0;
          final dy = widget.direction == Axis.vertical
              ? widget.offset * (1 - value)
              : 0.0;
          final scale = widget.scaleFrom + (widget.scaleTo - widget.scaleFrom) * value;
          final rotation = widget.rotateFrom + (widget.rotateTo - widget.rotateFrom) * value;
          return Opacity(
            opacity: value.clamp(0, 1),
            child: Transform.translate(
              offset: Offset(dx, dy),
              child: Transform.scale(
                scale: scale,
                child: Transform.rotate(
                  angle: rotation,
                  child: child,
                ),
              ),
            ),
          );
        },
        child: widget.child,
      ),
    );
  }
}
