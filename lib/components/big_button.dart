import 'package:flutter/material.dart';
import 'package:halp/misc/constants.dart';

class BigButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool filled;

  BigButton(this.text, {this.onPressed, this.filled = false});

  @override
  Widget build(BuildContext context) {
    Widget decoration() {}

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        child: RaisedButton(
          // minWidth: double.infinity,
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: filled ? BorderSide.none : BorderSide(color: mainPurple),
          ),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
              gradient: filled ? buttonMainGradient : null,
              color: filled ? mainPurple : mainWhite,
              borderRadius: BorderRadius.all(Radius.circular(80.0)),
            ),
            child: Container(
              constraints:
                  BoxConstraints(minWidth: 0, minHeight: 36.0), // min sizes for Material buttons
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.normal,
                    color: filled ? mainWhite : mainPurple,
                  ),
                ),
              ),
            ),
          ),
        )
        // child: MaterialButton(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(50.0),
        //     side: filled ? BorderSide.none : BorderSide(color: mainPurple),
        //   ),
        //   minWidth: double.infinity,
        //   color: filled ? mainPurple : mainWhite,
        //   child: Ink(
        //     decoration: BoxDecoration(
        //       gradient: buttonMainGradient,
        //       borderRadius: BorderRadius.all(Radius.circular(80.0)),
        //     ),
        //     child: Padding(
        //       padding: EdgeInsets.all(12.0),
        //       child: Text(
        //         text,
        //         style: TextStyle(
        //           fontSize: 26,
        //           fontWeight: FontWeight.normal,
        //           color: filled ? mainWhite : mainPurple,
        //         ),
        //       ),
        //     ),
        //   ),
        //   onPressed: onPressed,
        // ),
        );
  }
}
