import 'package:flutter/material.dart';
import 'package:halp/components/base_scaffold.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Text('test'),
    );
  }
}

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BaseScaffold(
//       body: Text('test'),
//     );
//   }
// }
