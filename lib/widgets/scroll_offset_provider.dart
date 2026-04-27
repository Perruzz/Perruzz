import 'package:flutter/material.dart';

class ScrollOffsetProvider extends InheritedWidget {
  final ValueNotifier<double> notifier;

  const ScrollOffsetProvider({
    required this.notifier,
    required super.child,
    super.key,
  });

  static ValueNotifier<double> of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<ScrollOffsetProvider>();
    assert(provider != null, 'No ScrollOffsetProvider found');
    return provider!.notifier;
  }

  @override
  bool updateShouldNotify(ScrollOffsetProvider old) => false;
}
