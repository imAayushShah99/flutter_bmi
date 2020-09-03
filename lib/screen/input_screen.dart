import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/components/bottom_button.dart';
import 'package:flutter_bmi_app/components/reusable_button.dart';
import 'package:flutter_bmi_app/components/reusable_card.dart';
import 'package:flutter_bmi_app/screen/result_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../calculator.dart';
import '../constant.dart';

enum Gender { male, female }

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  int height = 180;
  int age = 20;
  int weight = 40;
  Gender gender;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onTap: () {
                        setState(() {
                          gender = Gender.male;
                        });
                      },
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 80,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('MALE', style: ktextStyle),
                        ],
                      ),
                      color:
                          gender == Gender.male ? kinactiveColor : kactiveColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onTap: () {
                        setState(() {
                          gender = Gender.female;
                        });
                      },
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.venus,
                            size: 80,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'FEMALE',
                            style: ktextStyle,
                          ),
                        ],
                      ),
                      color: gender == Gender.female
                          ? kinactiveColor
                          : kactiveColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT', style: ktextStyle),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: kvalueStyle),
                        Text(' cm', style: ktextStyle),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Slider(
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                      value: height.toDouble(),
                      max: 300,
                      min: 100,
                    ),
                  ],
                ),
                color: kactiveColor,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: kactiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Age',
                            style: ktextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kvalueStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ReusableButton(
                                icon: Icon(FontAwesomeIcons.minus),
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              ReusableButton(
                                icon: Icon(FontAwesomeIcons.plus),
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kactiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Weight',
                            style: ktextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kvalueStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ReusableButton(
                                icon: Icon(FontAwesomeIcons.minus),
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              ReusableButton(
                                icon: Icon(FontAwesomeIcons.plus),
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              displayText: 'Calculate',
              onPress: () {
                Calculator calc = Calculator(height: height , weight : weight);
                if(gender!=null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultPage(
                          bmiResult: calc.calculateBMI(),
                          interpretation: calc.getIntrepretation(),
                          resultText: calc.getResult(),
                        );
                      },
                    ),
                  );
                }
                else{
                  Fluttertoast.showToast(
                    msg: 'Choose gender',
                    backgroundColor: Colors.black
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
