import 'package:flutter/material.dart';
import 'package:halp/misc/enum_tag_colors.dart';

class Tag extends StatelessWidget {
  final String text;
  final Function onPressed;
  final EnumTagColors enumTagColor;
  final TagColors tagColor;

  Tag(this.text, {this.onPressed, this.enumTagColor}) : tagColor = TagColors(enumTagColor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ButtonTheme(
        minWidth: 5,
        height: 25,
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: RaisedButton(
          materialTapTargetSize: MaterialTapTargetSize
              .shrinkWrap, // Necessary to remove the _inputpadding of the button
          elevation: 0,
          onPressed: onPressed,
          color: tagColor.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: tagColor.color,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
