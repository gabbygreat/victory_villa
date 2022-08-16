import 'package:flutter/material.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';

Widget horizontalLine({ String text='', bool showText = true}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: VictoryConstants.kPadding),
    child: Row(
      children: [
        Flexible(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              color: VictoryColor.primaryColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        if (showText)
          Padding(
            padding: EdgeInsets.only(left: VictoryConstants.kSpacing * 0.4),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: VictoryColor.faintColor.withOpacity(0.6),
                fontSize: 18,
              ),
            ),
          ),
        // Flexible(
        //   child: Container(
        //     height: 1,
        //     decoration: BoxDecoration(
        //       color: VictoryColor.primaryColor.withOpacity(0.7),
        //       borderRadius: BorderRadius.circular(5),
        //     ),
        //   ),
        // ),
      ],
    ),
  );
}
