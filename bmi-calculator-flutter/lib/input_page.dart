import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'card_fabs.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  void setGenderMale() {
    setState(() {
      selectedGender = Gender.male;
    });
  }

  void setGenderFemale() {
    setState(() {
      selectedGender = Gender.female;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      ),
                      onTap: setGenderMale,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        text: 'FEMALE',
                      ),
                      onTap: setGenderFemale,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: kInactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'HEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: <Widget>[
                              Text(height.toString(), style: kNumberTextStyle),
                              Text(
                                'cm',
                                style: kLabelTextStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Color(0XFF8D8E98),
                                thumbColor: Color(0XFFEB1555),
                                overlayColor: Color(0X29EB1555),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 30.0)),
                            child: Slider(
                                value: height.toDouble(),
                                min: 120.0,
                                max: 220.0,
                                onChanged: (double newValue) {
                                  setState(() {
                                    height = newValue.round();
                                  });
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  CardFabs(
                    label: 'WEIGHT',
                    item: weight,
                    add: () => setState(() => weight += 1),
                    remove: () => setState(() => weight -= 1),
                  ),
                  CardFabs(
                    label: 'AGE',
                    item: age,
                    add: () => setState(() => age += 1),
                    remove: () => setState(() => age -= 1),
                  ),
                ],
              ),
            ),
            Container(
                height: kBottomContainerHeigh,
                width: double.infinity,
                color: kBottomContainerColor,
                margin: EdgeInsets.only(top: 10.0))
          ],
        ));
  }
}
