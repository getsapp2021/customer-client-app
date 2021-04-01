import 'package:customer/src/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class GCircularProgressIndicator extends StatelessWidget {
  final Color color;

  const GCircularProgressIndicator({this.color});
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(color ?? ThemeColors.primary),
    ));
  }
}
