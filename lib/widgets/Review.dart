import 'package:flutter/material.dart';

import './Stars.dart';
import './Step.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget(
      {Key key,
      this.numberOfStars = 0,
      this.numberOfReviews = 0,
      this.stepsData})
      : super(key: key);

  final int numberOfStars;
  final int numberOfReviews;
  final stepsData;

  @override
  Widget build(BuildContext context) {
    final Widget stars = new Stars(numberOfStars: this.numberOfStars);
    final Widget reviews = new Text("${this.numberOfStars} Reviews");

    final steps = stepsData
        .map<Widget>((data) => new StepWidget(
            icon: data['icon'], title: data['title'], text: data['text']))
        .toList();
    final stepsWidget = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: steps,
    );

    return Container(
        child: Column(
      children: [
        Container(
            margin: const EdgeInsets.only(bottom: 50.0),
            child: Row(
                children: [stars, reviews],
                mainAxisAlignment: MainAxisAlignment.spaceBetween)),
        stepsWidget
      ],
    ));
  }
}