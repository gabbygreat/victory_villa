import 'package:flutter/material.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';

class OccupancyStatus extends StatelessWidget {
  const OccupancyStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Occupant Status'),
    );
  }
}
