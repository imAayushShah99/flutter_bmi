import 'dart:math';

class Calculator{
  Calculator({this.weight,this.height});
  final int height;
  final int weight;

  double _bmi;

  String getResult(){
    if(_bmi >= 25){
      return 'OverWeight';
    }else if(_bmi >= 18){
      return 'Normal';
    }else{
      return 'UnderWeight';
    }
  }

  String calculateBMI(){
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getIntrepretation(){
    if(_bmi >= 25){
      return 'You have high body weight';
    }else if(_bmi >= 18){
      return 'You are Fit';
    }else{
      return 'You have lower body weight';
    }
  }
}