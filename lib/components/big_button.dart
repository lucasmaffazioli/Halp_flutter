import 'package:flutter/material.dart';
import 'package:halp/misc/constants.dart';

class BigButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool filled;

  BigButton(this.text, {this.onPressed, this.filled = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: filled ? BorderSide.none : BorderSide(color: mainPurple),
        ),
        minWidth: double.infinity,
        color: filled ? mainPurple : mainWhite,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.normal,
              color: filled ? mainWhite : mainPurple,
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
