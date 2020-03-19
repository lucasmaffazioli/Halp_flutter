import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Widget child;

  PostCard({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          // color: Color(0x6000000),
          color: Color(0x6000000),
          offset: Offset(0, 33),
          blurRadius: 12,
        ),
      ]),
      child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: child,
          )),
    );
  }
}
