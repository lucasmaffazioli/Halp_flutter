import 'package:flutter/material.dart';
// import 'package:halp/misc/enum_tag_colors.dart';
import 'package:halp/misc/constants.dart';

class Tag extends StatelessWidget {
  final String text;
  final Function onPressed;
  // EnumTagColors enumTagColor;
  // TagColors tagColor = TagColors(enumTagColor);

  Tag(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    // getColor() {}
    // ;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        constraints:
            BoxConstraints(minWidth: 25, minHeight: 25.0), // min sizes for Material buttons
        decoration: BoxDecoration(
          gradient: tagMainGradient,
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Text(
            text,
            style: TextStyle(
              color: mainWhite,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
