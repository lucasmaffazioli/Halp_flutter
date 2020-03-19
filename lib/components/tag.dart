import 'package:flutter/material.dart';
// import 'package:halp/misc/enum_tag_colors.dart';
import 'package:halp/misc/constants.dart';

class Tag extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isBig;
  // EnumTagColors enumTagColor;
  // TagColors tagColor = TagColors(enumTagColor);

  Tag(this.text, {this.onPressed, this.isBig = false});

  @override
  Widget build(BuildContext context) {
    // getColor() {}
    // ;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        constraints:
            BoxConstraints(minWidth: 25, minHeight: 20.0), // min sizes for Material buttons
        decoration: BoxDecoration(
          gradient: tagMainGradient,
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Padding(
          padding: isBig
              ? EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                )
              : EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 4,
                ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: isBig ? FontWeight.bold : FontWeight.w300,
              color: mainWhite,
              fontSize: isBig ? 14 : 10,
            ),
          ),
        ),
      ),
    );
  }
}
