import '../components/bottom_button.dart';
import 'results_page.dart';
import 'package:flutter/cupertino.dart';
import '../components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import '../calculator.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = INACTIVE_CARD_COLOR;
  Color femaleCardColor = INACTIVE_CARD_COLOR;
  Gender selected;

  int height = 100;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selected = Gender.MALE;
                        });
                      },
                      colour: selected == Gender.MALE
                          ? ACTIVE_CARD_COLOR
                          : INACTIVE_CARD_COLOR,
                      cardChild: IconContentWidget(
                        iconData: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selected = Gender.FEMALE;
                        });
                      },
                      colour: selected == Gender.FEMALE
                          ? ACTIVE_CARD_COLOR
                          : INACTIVE_CARD_COLOR,
                      cardChild: IconContentWidget(
                          iconData: FontAwesomeIcons.venus, label: 'Female'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: ACTIVE_CARD_COLOR,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        activeTrackColor: Color(0xFFFFFFFF),
                        inactiveTrackColor: Color(0xFF8D8D98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        max: 220,
                        min: 100,
                        onChanged: (double value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: ACTIVE_CARD_COLOR,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  iconData: FontAwesomeIcons.minus),
                              SizedBox(
                                width: 20,
                              ),
                              RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  iconData: FontAwesomeIcons.plus),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: ACTIVE_CARD_COLOR,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  iconData: FontAwesomeIcons.minus),
                              SizedBox(
                                width: 20,
                              ),
                              RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  iconData: FontAwesomeIcons.plus),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onPressed: () {
                Calculator calc = Calculator(
                  height: height, weight: weight
                );
                String bmi = calc.calculateBMI();
                Navigator.push(
                  context,
                  MaterialPageRoute (
                      builder: (context) {
                        return ResultPage(
                          bmi: bmi,
                          result:calc.getResults(),
                          interpretation: calc.getInterperation(),
                        );
                      }
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.iconData, this.onPressed});

  final IconData iconData;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(
        iconData,
        color: Color(0xFFFFFFFF),
      ),
    );
  }
}
