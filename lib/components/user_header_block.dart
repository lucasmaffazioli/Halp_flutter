import 'package:flutter/material.dart';
import 'package:halp/misc/constants.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({
    Key key,
    @required this.avatar,
    @required this.userName,
    @required this.isVerified,
  }) : super(key: key);

  final String avatar;
  final String userName;
  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.end,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
            // backgroundImage: avatar,
            ),
        SizedBox(
          width: 10,
        ),
        Text(
          userName,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            shadows: [
              // Shadow(
              //   blurRadius: 2,
              //   // color: Color(0xFF8000FF),
              //   color: Colors.black,
              //   offset: Offset(0, 0),
              // ),
              Shadow(
                blurRadius: 10,
                color: Colors.blue,
                offset: Offset(0, 3.0),
              ),
            ],
            color: mainWhite,
          ),
        ),
      ],
    );
  }
}
