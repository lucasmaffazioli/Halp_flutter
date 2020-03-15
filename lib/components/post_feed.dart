import 'package:flutter/material.dart';
import 'package:halp/components/action_button.dart';
import 'package:halp/components/icon_label.dart';
import 'package:halp/components/tag.dart';
import 'package:halp/misc/constants.dart';
import 'package:halp/misc/enum_tag_colors.dart';
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
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Column(
        children: <Widget>[
          // IntrinsicHeight( // Removido pois bugava o widget INK
          // child:
          Row(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset('assets/images/mockup_video_Ayaki.jpg'),
                ),
              ),
              //
              //   SECOND COLUMN
              //
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 450,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                        Wrap(
                          // runAlignment: WrapAlignment.spaceBetween,
                          alignment: WrapAlignment.spaceAround,
                          // textDirection: TextDirection.ltr,
                          // crossAxisAlignment: WrapCrossAlignment.end,
                          spacing: 0, // gap between adjacent chips
                          runSpacing: 0, // gap between lines
                          children: <Widget>[
                            // Tag(
                            //   'a',
                            //   enumTagColor: EnumTagColors.red,
                            //   onPressed: () {},
                            // ),
                            // Tag(
                            //   'b',
                            //   enumTagColor: EnumTagColors.blue,
                            //   onPressed: () {},
                            // ),
                            Tag(
                              'Rave',
                              enumTagColor: EnumTagColors.red,
                              onPressed: () {},
                            ),
                            Tag(
                              'Estilo',
                              enumTagColor: EnumTagColors.blue,
                              onPressed: () {},
                            ),
                            Tag(
                              'Lifestyle',
                              enumTagColor: EnumTagColors.yellow,
                              onPressed: () {},
                            ),
                          ],
                        ),
                        ActionButton(
                          Icons.reply,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // ),
          Text(
            'Como ficar bonitão em uma rave?',
            style: TextStyle(
              fontSize: 26,
              fontFamily: 'RobotoCondensed',
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Divider(
              color: mainGrey,
            ),
          ),
        ],
      ),
    );
  }
}
