import 'package:flutter/material.dart';

class TextButtonStyle extends StatelessWidget {
  final String text;

  TextButtonStyle(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {},
          child: Text(text),
        ));
  }
}
