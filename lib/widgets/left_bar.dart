import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:flutter/material.dart';


class LeftBar extends StatelessWidget {
  final double barWidth;
  // const LeftBar ({Key key, }) : super(key: key);
  const LeftBar({Key? key, required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 25.0,
          width: barWidth,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
            color: accentHexColor
          ),
        )
      ],
    );
  }
}