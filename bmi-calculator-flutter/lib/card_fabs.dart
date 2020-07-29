import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'reusable_card.dart';

class CardFabs extends StatelessWidget {
  final String label;
  final int item;
  final Function add;
  final Function remove;

  CardFabs({this.label, this.item, this.add, this.remove});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        color: kInactiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(label, style: kLabelTextStyle),
            Text(item.toString(), style: kNumberTextStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RoundIconButton(
                    icon: FontAwesomeIcons.minus, onPressed: remove),
                RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: add)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onPressed,
    );
  }
}
