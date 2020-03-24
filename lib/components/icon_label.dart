import 'package:flutter/material.dart';
import 'package:halp/misc/constants.dart';

class IconLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool horizontal;
  IconLabel({
    @required this.icon,
    @required this.label,
    this.horizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    return horizontal
        ? Row(
            children: <Widget>[
              Icon(
                icon,
                size: 24,
                color: mainGrey,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                label,
                style: TextStyle(
                  color: mainGrey,
                  fontSize: 20,
                ),
              ),
            ],
          )
        : Column(
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
