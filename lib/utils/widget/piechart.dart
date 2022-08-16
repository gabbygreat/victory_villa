import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:victory_villa/utils/colors.dart';

class OccupancyChart extends StatelessWidget {
  final double occupied;
  final double unoccupied;
  const OccupancyChart(
      {Key? key, required this.occupied, required this.unoccupied})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, double> dataMap = {
      'Occupied': occupied,
      'Unoccupied': unoccupied,
    };
    final List<Color> colorList = [VictoryColor.green, VictoryColor.faintColor];
    return Center(
      child: PieChart(
        dataMap: dataMap,
        animationDuration: const Duration(milliseconds: 800),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 3,
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

class TenancyChart extends StatelessWidget {
  final double high;
  final double middle;
  final double low;
  const TenancyChart(
      {Key? key, required this.high, required this.low, required this.middle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, double> dataMap = {
      'Expired': high,
      'Mid-level': middle,
      'Safe': low,
    };
    final List<Color> colorList = [
      VictoryColor.red,
      Colors.orange,
      VictoryColor.green
    ];
    return Center(
      child: PieChart(
        dataMap: dataMap,
        animationDuration: const Duration(milliseconds: 1000),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 3,
        colorList: colorList,
        initialAngleInDegree: 0,
        chartType: ChartType.disc,
        ringStrokeWidth: 32,
        centerText: "Tenancy",
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
class FinanceChart extends StatelessWidget {
  final double income;
  final double expenditure;
  const FinanceChart(
      {Key? key, required this.income, required this.expenditure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, double> dataMap = {
      'Income': income,
      'Expenditure': expenditure,
    };
    final List<Color> colorList = [
      VictoryColor.green,
      VictoryColor.red
    ];
    return Center(
      child: PieChart(
        dataMap: dataMap,
        animationDuration: const Duration(milliseconds: 1000),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 3,
        colorList: colorList,
        initialAngleInDegree: 0,
        chartType: ChartType.disc,
        ringStrokeWidth: 32,
        centerText: "Finance",
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
