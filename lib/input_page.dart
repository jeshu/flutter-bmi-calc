import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';

const double bottomContainerHeight = 80;
const Color ACTIVE_CARD_COLOR = Color(0xFF323244);
const Color BUTTON_COLOR = Color(0xFFBC1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
              children: [
                Expanded(
                  child: ReusableCard(
                      colour:ACTIVE_CARD_COLOR,
                      cardChild: IconContentWidget(
                        iconData: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      colour:ACTIVE_CARD_COLOR,
                    cardChild: IconContentWidget(
                      iconData: FontAwesomeIcons.venus,
                      label: 'Female'
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(colour:ACTIVE_CARD_COLOR),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour:ACTIVE_CARD_COLOR),
                ),
                Expanded(
                  child: ReusableCard(colour:ACTIVE_CARD_COLOR),
                ),
              ],
            ),
          ),
          Container(
            color: BUTTON_COLOR,
            margin: EdgeInsets.only(top:10),
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}


class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild});
  final Color colour;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
      ),
      child: cardChild,
    );
  }
}
