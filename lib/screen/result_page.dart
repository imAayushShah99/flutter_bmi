import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/components/bottom_button.dart';
import 'package:flutter_bmi_app/components/reusable_card.dart';

import '../constant.dart';

class ResultPage extends StatelessWidget {

  final String bmiResult , resultText , interpretation ;
  ResultPage({this.bmiResult,this.interpretation,this.resultText,});


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
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 10),
              child: Text(
                'Your Results Are',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmiResult,
                    style: kvalueStyle,
                  ),
                  Text(
                    interpretation,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            displayText: 'Re-Calculate',
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
