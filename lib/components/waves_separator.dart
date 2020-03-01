import 'package:flutter/material.dart';

class WavesSeparator extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Colors.transparent;
    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();
    // Start paint from 20% height to the left
    ovalPath.moveTo(0, 25);
    // ovalPath.moveTo(15, 25);
    // ovalPath.moveTo(50, 25);
    // ovalPath.moveTo(0, height * 0.2);

    // paint a curve from current position to middle of the screen
    ovalPath.quadraticBezierTo(width * 0.07, -10, width * 0.21, 25);
    ovalPath.quadraticBezierTo(width * 0.32, 55, width * 0.47, 25);
    ovalPath.quadraticBezierTo(width * 0.70, -8, width * 0.87, 35);
    ovalPath.quadraticBezierTo(width * 0.95, 50, width, 45);

    ovalPath.lineTo(width, height);
    ovalPath.lineTo(0, height);

    // Close line to reset it back
    ovalPath.close();

    paint.color = Colors.white;
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
