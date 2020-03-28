import 'package:flutter/material.dart';
import 'package:halp/misc/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
        // Image.network(
        //   'https://picsum.photos/250?image=9',
        // ),
        // CircleAvatar(
        //   backgroundImage: CachedNetworkImage(
        //     imageUrl: "http://via.placeholder.com/350x150",
        //     placeholder: (context, url) => CircularProgressIndicator(),
        //     errorWidget: (context, url, error) => Icon(Icons.error),
        //   ),
        // ),
        CustomCircleAvatar(
          animationDuration: 300,
          radius: 50.0,
          imagePath: avatar,
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
        SizedBox(
          width: 5,
        ),
        if (isVerified)
          Icon(
            Octicons.verified,
            color: kVerifiedBlue,
            size: 20,
          ),
      ],
    );
  }
}

class CustomCircleAvatar extends StatelessWidget {
  final int animationDuration;
  final double radius;
  final String imagePath;

  const CustomCircleAvatar({Key key, this.animationDuration, this.radius, this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: animationDuration,
      ),
      constraints: BoxConstraints(
        minHeight: radius,
        maxHeight: radius,
        minWidth: radius,
        maxWidth: radius,
      ),
      child: ClipOval(
        child: IntrinsicHeight(
          child: IntrinsicWidth(
            child: CachedNetworkImage(
              imageUrl: imagePath,
              placeholder: (context, url) => new CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
