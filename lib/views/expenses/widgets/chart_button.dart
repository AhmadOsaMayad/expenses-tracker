import 'package:expenses_tracker/extensions/is_dark_mode.dart';
import 'package:flutter/material.dart';

class ChartButton extends StatelessWidget {
  const ChartButton({
    super.key,
    required this.iconData,
    required this.secondary,
    required this.primary,
  });

  final IconData iconData;
  final Color secondary;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Icon(
        iconData,
        color: isDarkMode ? secondary : primary.withAlpha(179),
      ),
    );
  }
}
