import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:vetqure_task/widgets/walk_in_client_chart_widgets/title_widgets.dart';

class WalkInChart extends StatelessWidget {
  final double height;
  final double width;

  const WalkInChart({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            horizontalInterval: 10,
            verticalInterval: 1,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey[300],
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.grey[300],
                strokeWidth: 1,
              );
            },
          ),
          titlesData: const FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: bottomTitleWidgets,
                interval: 1,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 10,
                getTitlesWidget: leftTitleWidgets,
                reservedSize: 50,
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(color: Colors.grey[400]!, width: 1),
              left: BorderSide(color: Colors.grey[400]!, width: 1),
            ),
          ),
          minX: 0,
          maxX: 8,
          minY: 0,
          maxY: 50,
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(1, 7),
                FlSpot(2, 20),
                FlSpot(3, 22),
                FlSpot(4, 30),
                FlSpot(5, 30),
                FlSpot(6, 30),
                FlSpot(7, 30),
                FlSpot(8, 35),
              ],
              isCurved: true,
              color: Colors.blue,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 4,
                    color: Colors.blue,
                    strokeWidth: 2,
                    strokeColor: Colors.blue,
                  );
                },
              ),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
