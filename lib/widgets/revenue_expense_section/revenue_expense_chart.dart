import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class RevenueExpenseChart extends StatelessWidget {
  const RevenueExpenseChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            SizedBox(height: constraints.maxHeight * 0.05),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 60,
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) => Text(
                            getBottomTitles(value),
                            style: TextStyle(
                                fontSize: constraints.maxWidth * 0.03),
                          ),
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          getTitlesWidget: (value, meta) => Text(
                            value.toInt().toString(),
                            style: TextStyle(
                                fontSize: constraints.maxWidth * 0.03),
                          ),
                        ),
                      ),
                      topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      horizontalInterval: 10,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.grey.withOpacity(0.3),
                          strokeWidth: 1,
                        );
                      },
                      drawVerticalLine: true,
                      verticalInterval: 1,
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: Colors.grey.withOpacity(0.3),
                          strokeWidth: 1,
                        );
                      },
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: const Border(
                        left: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    barGroups: [
                      createBarGroup(0, 57, Colors.green),
                      createBarGroup(1, 29, Colors.red),
                      createBarGroup(2, 18, Colors.orange),
                      createBarGroup(3, 7, Colors.blue),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String getBottomTitles(double value) {
    switch (value.toInt()) {
      case 0:
        return 'Revenue';
      case 1:
        return 'Expense';
      case 2:
        return 'Miscellaneous';
      case 3:
        return 'Other';
      default:
        return '';
    }
  }

  BarChartGroupData createBarGroup(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color,
          width: 25,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}
