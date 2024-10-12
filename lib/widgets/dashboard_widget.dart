import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(constraints),
                const SizedBox(height: 16),
                _buildMetrics(constraints),
                const SizedBox(height: 24),
                _buildChart(constraints),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Walk In Client',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.filter_list),
          label: const Text('Filter'),
        ),
      ],
    );
  }

  Widget _buildMetrics(BoxConstraints constraints) {
    final isWide = constraints.maxWidth > 600;
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _buildMetricCard('Total Walk In', '20', null),
        _buildMetricCard('New Client', '20', -20),
        _buildMetricCard('New Client', '20', -20),
      ],
    );
  }

  Widget _buildMetricCard(String title, String value, int? percentage) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(value,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              if (percentage != null) ...[
                const SizedBox(width: 8),
                Text(
                  '${percentage > 0 ? '+' : ''}$percentage%',
                  style: TextStyle(
                    color: percentage > 0 ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChart(BoxConstraints constraints) {
    return SizedBox(
      height: 300,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const titles = [
                    '9-10am',
                    '10-11am',
                    '11-12pm',
                    '12-1pm',
                    '1-2pm',
                    '2-3pm',
                    '4-5pm',
                    '5-6pm',
                    '6-7pm'
                  ];
                  if (value.toInt() < titles.length) {
                    return Text(titles[value.toInt()],
                        style: const TextStyle(fontSize: 10));
                  }
                  return const Text('');
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 10,
                getTitlesWidget: (value, meta) {
                  return Text(value.toInt().toString(),
                      style: const TextStyle(fontSize: 10));
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 11),
                FlSpot(1, 22),
                FlSpot(2, 25),
                FlSpot(3, 31),
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
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
