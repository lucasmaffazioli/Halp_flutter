import 'package:flutter/material.dart';

class InputRegister extends StatelessWidget {
  final String label;
  final Icon icon;
  final Function validator;
  final Function onSaved;

  InputRegister({
    @required this.label,
    @required this.icon,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          icon: icon,
          hintText: 'What do people call you?',
          labelText: label,
        ),
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
