
import 'package:blind_box/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class StarWidget extends StatelessWidget {
  final int value;
  final Function(double) onChange;
  const StarWidget({
    super.key,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: value.toDouble(),
      onValueChanged: (v) {
        onChange.call(v);
      },
      starBuilder: (index, color) {
        if (color == primaryColor) {
          return Icon(Icons.star,size: 15,color: primaryColor,);
        }
        return const Icon(Icons.star,size: 15,color: Color(0xffc7c7c7),);
      },
      starCount: 5,
      starSize: 15,
      maxValue: 5,
      starSpacing: 4,
      maxValueVisibility: false,
      valueLabelVisibility: false,
      animationDuration: const Duration(milliseconds: 1000),
      starOffColor: Colors.transparent,
      starColor: primaryColor,
    );
  }
}
