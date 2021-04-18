import 'package:customer/src/ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';

class GCircularProgressIndicator extends StatelessWidget {
  final Color color;
  final bool center;
  final double strokeWidth;

  const GCircularProgressIndicator(
      {this.color, this.center = true, this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    final progressIndicator = CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(color ?? ThemeColors.primary),
      strokeWidth: strokeWidth,
    );
    return center ? Center(
      child: progressIndicator,
    ) : progressIndicator;
  }
}
