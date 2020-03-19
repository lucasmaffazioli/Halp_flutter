import 'package:flutter/material.dart';

class ImageFormatter extends StatelessWidget {
  final Widget child;
  final double height;

  ImageFormatter({this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: Image.asset(
          'assets/images/mockup_video_Ayaki.jpg',
          fit: BoxFit.fitWidth,
        ),
      ),
      // child
    );
  }
}
