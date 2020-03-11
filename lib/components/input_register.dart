import 'package:flutter/material.dart';

class InputRegister extends StatelessWidget {
  final String label;
  final Icon icon;
  final Function validator;

  InputRegister({
    @required this.label,
    @required this.icon,
    this.validator,
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
        onSaved: (String value) {
          // This optional block of code can be used to run
          // code when the user saves the form.
        },
        validator: validator,
      ),
    );
  }
}
