import 'package:flutter/material.dart';
import 'package:halp/components/base_scaffold.dart';
import 'package:halp/screens/login/login.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        body: Container(
      child: MaterialButton(
        onPressed: () {
          // Navigator.pushNamed(context, Login.routeName);
          Navigator.pushNamedAndRemoveUntil(context, Login.routeName, (r) => false);
        },
        child: Text('Logout'),
      ),
    ));
  }
}
