import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GBackButton extends StatelessWidget {
  const GBackButton({ this.color, this.onPressed });

  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return IconButton(
      icon: Icon(Icons.arrow_back_ios,),
      color: color,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        } else {
          Navigator.maybePop(context);
        }
      },
    );
  }
}