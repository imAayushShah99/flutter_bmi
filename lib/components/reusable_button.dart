import 'package:flutter/material.dart';


class ReusableButton extends StatelessWidget {
  final Function onPress;
  final Icon icon;
  ReusableButton({this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: icon,
      shape: CircleBorder(),
      fillColor: Colors.white24,
      constraints: BoxConstraints.tightFor(width: 50, height: 50),
    );
  }
}
