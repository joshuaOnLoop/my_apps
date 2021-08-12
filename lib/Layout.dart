import 'package:flutter/material.dart';
import './widgets/Review.dart';

class Layout extends StatelessWidget {
  final text = Text("Hello Word");

  @override
  Widget build(BuildContext context) {
    // klee container
    final kleeImage = Image.asset('assets/images/klee.png', fit: BoxFit.cover);
    final klee = Expanded(
        child: Container(
      child: kleeImage,
      padding: EdgeInsets.all(25.0),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.red, width: 3)),
    ));

    // yoimiya container
    final yoimiyaImage =
        Image.asset('assets/images/yoimiya.png', fit: BoxFit.cover);
    final yoimiya = Expanded(
        child: Container(
      child: yoimiyaImage,
      padding: EdgeInsets.all(25.0),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.red, width: 3)),
    ));

    // mona container
    final monaImage = Image.asset('assets/images/mona.webp', fit: BoxFit.cover);
    final mona = Expanded(
      child: Container(
        child: monaImage,
        padding: EdgeInsets.all(25.0),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.red, width: 3)),
      ),
    );

    // character Row
    final characterRow = IntrinsicHeight(
      child: Row(
        children: [klee, yoimiya, mona],
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );

    // Steps
    final stepsData = [
      {
        "icon": Icon(Icons.sports_outlined, color: Colors.green),
        "title": "PREP",
        "text": "25 min",
      },
      {
        "icon": Icon(Icons.timelapse, color: Colors.green),
        "title": "COOK",
        "text": "1 hr",
      },
      {
        "icon": Icon(Icons.four_k, color: Colors.green),
        "title": "FEEDS",
        "text": "4 - 6",
      },
    ];
    final Widget reviewWidget = new ReviewWidget(
        numberOfStars: 4, numberOfReviews: 172, stepsData: stepsData);

    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Layout Demo"),
          actions: [],
        ),
        body: Column(children: [
          characterRow,
          Center(
            child: reviewWidget,
          )
        ]));
  }
}
