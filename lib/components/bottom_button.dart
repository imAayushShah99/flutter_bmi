import 'package:flutter/material.dart';

import '../constant.dart';

class BottomButton extends StatelessWidget {
  final String displayText;
  final Function onPress;
  BottomButton({this.displayText, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: Colors.red,
        height: 70.0,
        child: Center(
          child: Text(
            '$displayText',
            style: ktextStyle,
          ),
        ),
      ),
    );
  }
}
