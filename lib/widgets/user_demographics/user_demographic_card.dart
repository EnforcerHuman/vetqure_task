import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:vetqure_task/widgets/common/section_header.dart';

class UserDemographicCard extends StatelessWidget {
  const UserDemographicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var isLargeScreen = constraints.maxWidth > 1300;
      double cardHeight = isLargeScreen ? 300 : constraints.maxHeight * 0.5;
      var media = MediaQuery.of(context).size;
      double cardWidth =
          media.width > 1300 ? media.width * 0.2 : media.width * 0.9;
      return SizedBox(
        height: cardHeight,
        width: cardWidth,
        child: Card(
          elevation: 4,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SectionHeader(
                  title: 'User Demographics',
                  isFilter: true,
                ),
                // Use SizedBox to constrain the pie chart
                SizedBox(
                  height: cardHeight * 0.5, // Set a height for the pie chart
                  width: cardWidth * 0.5, // Set a width for the pie chart
                  child: const UserDemographicsPieChartWidget(),
                ),
                _buildLegend(),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class UserDemographicsPieChartWidget extends StatelessWidget {
  const UserDemographicsPieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sectionsSpace: 0, // No space between sections
        centerSpaceRadius: 0, // No center space
        sections: _getSections(),
      ),
    );
  }

  List<PieChartSectionData> _getSections() {
    return [
      _buildSection(Colors.purple[300]!, 35),
      _buildSection(Colors.pink[200]!, 25),
      _buildSection(Colors.green, 50),
    ];
  }

  PieChartSectionData _buildSection(Color color, double value) {
    return PieChartSectionData(
      color: color,
      value: value,
      title: '${value.toInt()}%',
      radius: 80, // Set a fixed radius for better control
      titleStyle: const TextStyle(
        fontSize: 16, // Fixed font size for clarity
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

Widget _buildLegend() {
  return Wrap(
    spacing: 16,
    runSpacing: 8,
    alignment: WrapAlignment.center,
    children: [
      _buildLegendItem(Colors.green, 'Pattom'),
      _buildLegendItem(Colors.pink[200]!, 'Thampanoor'),
      _buildLegendItem(Colors.purple[300]!, 'Kowdiar'),
    ],
  );
}

Widget _buildLegendItem(Color color, String label) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 10,
        height: 10,
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
