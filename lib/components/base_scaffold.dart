import 'package:flutter/material.dart';
import 'package:halp/misc/constants.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:provider/provider.dart';
import 'package:halp/models/login_model.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String currentUser;
  BaseScaffold({@required this.body, this.currentUser});

  @override
  Widget build(BuildContext context) {
    String _currentUser = '';

    return Consumer<LoginModel>(
      builder: (context, loginModel, child) {
        print('--------------------------------------------');
        print('BaseLayout');
        _currentUser = loginModel.getCurrentUser();
        print(_currentUser);

        bool isUserLogged = _currentUser.isNotEmpty;
        return Scaffold(
          appBar: !isUserLogged
              ? null
              : AppBar(
                  automaticallyImplyLeading:
                      false, // Don't show the leading button that creates apding
                  backgroundColor: mainWhite,
                  brightness: Brightness.light,
                  elevation: 4,
                  title: Text(
                    'HALP.',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: mainFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
          body: body,
          bottomNavigationBar: !isUserLogged
              ? null
              : BottomAppBar(
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(OMIcons.home),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(OMIcons.addBox),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {},
                      ),
                      CircleAvatar(
                        maxRadius: 16,
                        minRadius: 16,
                        backgroundImage: AssetImage('assets/images/mockup_jake_avatar.jpg'),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
