import 'package:flutter/material.dart';

class ImageFormatter extends StatelessWidget {
  final Widget child;
  final double height;
  final String image;

  ImageFormatter({this.child, this.height, this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: Image.asset(
          image,
          fit: BoxFit.fitWidth,
        ),
      ),
      // child
    );
  }
}
