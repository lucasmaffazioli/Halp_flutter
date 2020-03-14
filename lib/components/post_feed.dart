import 'package:flutter/material.dart';
import 'package:halp/components/icon_label.dart';
import 'package:halp/misc/constants.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:flutter/services.dart';

class PostFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // systemNavigationBarColor: Colors.blue,
      statusBarColor: mainWhite,
    ));
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          IntrinsicHeight(
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset('assets/images/mockup_video_Ayaki.jpg'),
                  ),
                ),
                //
                //   SECOND COLUMN
                //
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.more_vert,
                        color: mainGrey,
                      ),
                      IconLabel(
                        icon: Icons.favorite_border,
                        label: '25',
                      ),
                      IconLabel(
                        icon: OMIcons.modeComment,
                        label: '2',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Como baforar sem ter uma bed trip?',
            style: TextStyle(
              fontSize: 26,
              fontFamily: 'RobotoCondensed',
            ),
          ),
        ],
      ),
    );
  }
}
