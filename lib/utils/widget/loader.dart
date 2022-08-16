import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:victory_villa/utils/colors.dart';

class VictoryLoader extends StatelessWidget {
  const VictoryLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.newtonCradle(
        size: 200,
        color: VictoryColor.primaryColor,
      ),
    );
  }
}
