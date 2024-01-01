import 'dart:ui';

import 'package:flutter/material.dart';

Color getColorForCategory(String? category) {
  switch (category) {
    case 'important':
      return Colors.red;
    case 'event':
      return Colors.lightGreen;
    case 'appintment':
      return Colors.blueAccent;
    case 'Meeting':
      return Colors.deepPurple;
    case 'other':
      return Colors.grey;
    default:
      return Colors.transparent;
  }
}
