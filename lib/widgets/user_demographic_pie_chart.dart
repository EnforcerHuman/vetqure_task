import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class UserDemographicsPieChart extends StatelessWidget {
  const UserDemographicsPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final maxHeight = constraints.maxHeight;
        final size = maxWidth < maxHeight ? maxWidth : maxHeight;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'User Demographics',
                    // style: Theme.of(context).textTheme.headline6?.copyWith(
                    //       fontWeight: FontWeight.bold,
                    //     ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      // Implement filter functionality
                    },
                    icon: const Icon(Icons.filter_list),
                    label: const Text('Filter'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      side: const BorderSide(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size,
              height: size,
              child: Stack(
                children: [
                  PieChart(
                    PieChartData(
                      sectionsSpace: 0,
                      centerSpaceRadius: size * 0.2,
                      sections: [
                        PieChartSectionData(
                          color: Colors.green,
                          value: 50,
                          title: '50%',
                          radius: size * 0.35,
                          titleStyle: TextStyle(
                            fontSize: size * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        PieChartSectionData(
                          color: Colors.pink[200],
                          value: 25,
                          title: '25%',
                          radius: size * 0.35,
                          titleStyle: TextStyle(
                            fontSize: size * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        PieChartSectionData(
                          color: Colors.purple[300],
                          value: 35,
                          title: '35%',
                          radius: size * 0.35,
                          titleStyle: TextStyle(
                            fontSize: size * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                _buildLegendItem(Colors.green, 'Pattom'),
                _buildLegendItem(Colors.pink[200]!, 'Thampanoor'),
                _buildLegendItem(Colors.purple[300]!, 'Kowdiar'),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}
