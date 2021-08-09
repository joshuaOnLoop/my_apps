import 'package:flutter/material.dart';

class StepWidget extends StatelessWidget {
  const StepWidget({
    Key key,
    this.icon = const Icon(Icons.ac_unit, color: null),
    this.title = 'Pain',
    this.text = '1 min',
  }) : super(key: key);

  final Icon icon;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    final descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );

    return DefaultTextStyle.merge(
        style: descTextStyle,
        child: Column(
          children: [this.icon, Text(this.title), Text(this.text)],
        ));
  }
}