import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({ @required this.onPressed, @required this.buttonTitle });

  final Function onPressed;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: BUTTON_COLOR,
        margin: EdgeInsets.only(top: 10),
        height: bottomContainerHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeBtnStyle,
          ),
        ),
      ),
    );
  }
}