import '../constants.dart';
import '../components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {

  ResultPage({this.bmi, this.interpretation, this.result});

  final String bmi;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kLargeTxtStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: ACTIVE_CARD_COLOR,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      result,
                      style: kResultTxtStyle,
                    ),
                    Text(
                      bmi,
                      style: kBMITxtStyle,
                    ),
                    Text(
                      interpretation,
                      style: kBodyTxtStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            BottomButton(onPressed: () {
              Navigator.pop(context);
            }, buttonTitle: 'RE-CALCULATE')
          ],
        ));
  }
}
