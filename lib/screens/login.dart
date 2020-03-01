import 'package:flutter/material.dart';
import 'package:halp/screens/feed_screen.dart';

class Login extends StatelessWidget {
  final loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // fontFamily: 'MPLUSRounded1c',
          // fontFamily: GoogleFonts.mPLUSRounded1c(),
          ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFA200FF), Color(0xFF560070)])),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'HALP.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 46,
                        fontFamily: 'MPLUSRounded1c',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '''HALP existe para você 
encontrar todas as 
respostas para sua vida''',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: 'MPLUSRounded1c',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: CustomPaint(
                    painter: BluePainter(),
                    child: MaterialButton(
                      child: Text('Entrar'),
                      onPressed: () {
                        print(loginController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FeedScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BluePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    // paint.color = Colors.red;
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
    ovalPath.quadraticBezierTo(width * 0.35, 60, width * 0.47, 25);
    ovalPath.quadraticBezierTo(width * 0.60, -8, width * 0.87, 35);
    ovalPath.quadraticBezierTo(width * 0.95, 50, width, 25);

    // ovalPath.moveTo(width * 0.61, -10);
    // ovalPath.quadraticBezierTo(width * 0.45, height * 0.25, width * 0.61, -10);

    // Paint a curve from current position to bottom left of screen at width * 0.1
    // ovalPath.quadraticBezierTo(width * 0.58, height * 0.8, width * 0.75, height);

    // draw remaining line to bottom left side
    ovalPath.lineTo(width, height);
    ovalPath.lineTo(0, height);

    // Close line to reset it back
    ovalPath.close();

    paint.color = Colors.white;
    // paint.color = Colors.blue.shade600;
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
