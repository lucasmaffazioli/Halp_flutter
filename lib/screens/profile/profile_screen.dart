import 'package:flutter/material.dart';
import 'package:halp/screens/login/login.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialButton(
      onPressed: () {
        // Navigator.pushNamedAndRemoveUntil(context, Login.routeName, (r) => false);
        Navigator.of(context, rootNavigator: true)
            .pushNamedAndRemoveUntil(Login.routeName, (r) => false);
      },
      child: Text('Logout'),
    ));
  }
}
