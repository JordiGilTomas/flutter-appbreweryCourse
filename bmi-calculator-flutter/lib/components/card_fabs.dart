import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import 'reusable_card.dart';
import 'round_icon_button.dart';

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
