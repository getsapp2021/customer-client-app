import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);
}
