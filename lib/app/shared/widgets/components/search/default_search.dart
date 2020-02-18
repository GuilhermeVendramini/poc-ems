import 'package:flutter/material.dart';

class DefaultSearch extends StatelessWidget {
  final String hintText;
  final Function onTap;

  DefaultSearch({@required this.hintText, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8.0,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(10.0),
      child: TextField(
        onTap: onTap,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
