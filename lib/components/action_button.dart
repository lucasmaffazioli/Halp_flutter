import 'package:flutter/material.dart';
import 'package:halp/misc/constants.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  ActionButton(this.icon, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: ButtonTheme(
        height: 60,
        minWidth: 60,
        child: RaisedButton(
          elevation: 5,
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
          ),
          padding: const EdgeInsets.all(0.0),
          child: Ink(
            decoration: const BoxDecoration(
              gradient: buttonMainGradient,
              borderRadius: BorderRadius.all(
                Radius.circular(80.0),
              ),
            ),
            child: Container(
              constraints: const BoxConstraints(
                minWidth: 60,
                minHeight: 60,
              ),
              alignment: Alignment.center,
              child: Icon(
                icon,
                color: mainWhite,
                size: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
