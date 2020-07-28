import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const textStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));

class IconContent extends StatelessWidget {
  final IconData icon;
  final String text;

  IconContent({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FaIcon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(text, style: textStyle),
      ],
    );
  }
}
