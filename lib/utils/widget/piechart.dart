import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:victory_villa/utils/colors.dart';

class VictoryPieChart extends StatelessWidget {
  final double all;
  final double occupied;
  final double unoccupied;
  const VictoryPieChart(
      {Key? key,
      required this.all,
      required this.occupied,
      required this.unoccupied})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, double> dataMap = {
      'Occupied': occupied,
      'Unoccupied': unoccupied,
    };
    final List<Color> colorList = [
      VictoryColor.green,
      VictoryColor.faintColor
    ];
    return Center(
      child: PieChart(
        dataMap: dataMap,
        animationDuration: const Duration(milliseconds: 800),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 3.2,
        colorList: colorList,
        initialAngleInDegree: 0,
        chartType: ChartType.disc,
        ringStrokeWidth: 32,
        centerText: "Occupancy",
        legendOptions: const LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.right,
          showLegends: true,
          legendShape: BoxShape.circle,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesInPercentage: true,
          showChartValuesOutside: true,
          decimalPlaces: 1,
        ),
        // gradientList: ---To add gradient colors---
        // emptyColorGradient: ---Empty Color gradient---
      ),
    );
  }
}
