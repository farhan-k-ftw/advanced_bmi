import 'dart:math';

class CalculateBMI {
  final int height;
  final int weight;
  double _bmi = 0.0;

  CalculateBMI({required this.height, required this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String feedBack() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight.\nTry to exercise more. Those who are overweight (BMI of 25 to 29.9), it is recommended that you lose weight.';
    } else if (_bmi > 18.5) {
      return 'You have normal body weight. Congratulations!';
    } else {
      return 'Eat more frequently. You are underweight.\nEat may you feel full faster.';
    }
  }
}
