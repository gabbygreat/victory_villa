import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:victory_villa/utils/assets.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: VictoryConstants.kPadding * 2,
        ),
        child: Column(
          children: [
            Expanded(
              child: SvgPicture.asset(VictoryAssets.network),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'RETRY\n',
                style: TextStyle(
                  color: VictoryColor.faintColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  decorationStyle: TextDecorationStyle.dashed,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
