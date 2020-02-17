import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Function validator;
  final Function onSaved;
  final Function onChanged;
  final TextInputType textInputType;
  final bool obscureText;
  final bool enabled;
  final String helperText;

  DefaultTextFormField({
    @required this.hintText,
    @required this.icon,
    @required this.validator,
    this.onSaved,
    this.textInputType = TextInputType.multiline,
    this.obscureText = false,
    this.enabled = true,
    this.onChanged,
    this.helperText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      enabled: enabled,
      obscureText: obscureText,
      maxLines: 1,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        helperText: helperText,
        icon: Icon(
          icon,
          //color: Colors.grey,
        ),
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
