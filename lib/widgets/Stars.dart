import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  const Stars({Key key, this.numberOfStars}) : super(key: key);

  final int numberOfStars;

  @override
  Widget build(BuildContext context) {
    // stars
    const MAX_STARS = 5;
    final nArray = Iterable<int>.generate(MAX_STARS).toList();
    final starsArray = nArray
        .map((index) => (index < this.numberOfStars)
            ? Icon(Icons.star, color: Colors.green)
            : Icon(Icons.star_border, color: null))
        .toList();
    final stars = Row(
      children: starsArray,
    );

    return stars;
  }
}