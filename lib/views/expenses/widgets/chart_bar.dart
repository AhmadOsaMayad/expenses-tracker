import 'package:expenses_tracker/extensions/is_dark_mode.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill, this.width = 40});

  final double fill;
  final double width;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;
    // MediaQuery.of(context).platformBrightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          alignment: Alignment.bottomCenter,
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              color: isDarkMode
                  ? colorScheme.secondary
                  : colorScheme.primary.withAlpha(150),
            ),
          ),
        ),
      ),
    );
  }
}
