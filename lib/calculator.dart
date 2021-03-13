import 'dart:math';

class Calculator {
  Calculator({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;
  String calculateBMI() {
    _bmi = weight/ pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if(_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterperation() {
    if(_bmi >= 25) {
      return 'You have higher then normal body weight, Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have Normal body weight. Good Job.';
    } else {
      return 'You have lower then normal body weight, Try to eat more.';
    }
  }
}