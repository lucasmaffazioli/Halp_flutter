// TODO - Deprecated

import 'package:flutter/material.dart';

enum EnumTagColors { red, blue, green, purple, yellow }

class TagColors {
  final EnumTagColors enumColor;
  Color backgroundColor;
  Color color;

  TagColors(this.enumColor) {
    switch (enumColor) {
      case EnumTagColors.blue:
        backgroundColor = Color(0xFFDAE4FF);
        color = Color(0xFF5870B4);
        break;
      case EnumTagColors.green:
        backgroundColor = Color(0xFFFFD1CD);
        color = Color(0xFFB76259);
        break;
      case EnumTagColors.purple:
        backgroundColor = Color(0xFFFFD1CD);
        color = Color(0xFFB76259);
        break;
      case EnumTagColors.red:
        backgroundColor = Color(0xFFFFD1CD);
        color = Color(0xFFB76259);
        break;
      case EnumTagColors.yellow:
        backgroundColor = Color(0xFFFFE5BA);
        color = Color(0xFFC89239);
        break;
    }
  }
}
