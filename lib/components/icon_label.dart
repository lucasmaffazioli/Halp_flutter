import 'package:flutter/material.dart';
import 'package:halp/misc/constants.dart';

class IconLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  IconLabel({
    @required this.icon,
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: mainGrey,
        ),
        Text(
          label,
          style: TextStyle(color: mainGrey),
        ),
      ],
    );
  }
}
