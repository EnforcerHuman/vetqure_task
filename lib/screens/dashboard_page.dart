import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:vetqure_task/widgets/side_bar.dart';
import 'package:vetqure_task/widgets/user_demographic_pie_chart.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isDrawerOpen = false;

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth >= 600;

    return Scaffold(
      appBar: isLargeScreen
          ? null
          : AppBar(
              title: const Text('Dashboard'),
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: _toggleDrawer,
              ),
            ),
      body: Row(
        children: [
          if (isLargeScreen) const SideBarWidget(),
          Expanded(
            child: Stack(
              children: [
                SafeArea(
                  child: Row(
                    children: [
                      Expanded(
                          child:
                              DashboardContent(isLargeScreen: isLargeScreen)),
                      const Expanded(child: UserDemographicsPieChart())
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  final bool isLargeScreen;

  const DashboardContent({super.key, required this.isLargeScreen});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardHeader(isLargeScreen: isLargeScreen),
            const SizedBox(height: 16),
            const DashboardMetrics(),
            const SizedBox(height: 24),
            const DashboardChart(),
          ],
        ),
      ),
    );
  }
}

// In a new file: lib/widgets/dashboard_widgets.dart

class DashboardHeader extends StatelessWidget {
  final bool isLargeScreen;

  const DashboardHeader({super.key, required this.isLargeScreen});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Walk In Client',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        if (isLargeScreen)
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
            label: const Text('Filter'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
            ),
          ),
      ],
    );
  }
}

class DashboardMetrics extends StatelessWidget {
  const DashboardMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        MetricCard(title: 'Total Walk In', value: '20'),
        MetricCard(title: 'New Client', value: '20', percentage: -20),
        MetricCard(title: 'New Client', value: '20', percentage: -20),
      ],
    );
  }
}

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final int? percentage;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
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
                  '${percentage! > 0 ? '+' : ''}$percentage%',
                  style: TextStyle(
                    color: percentage! > 0 ? Colors.green : Colors.blue,
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
}

class DashboardChart extends StatelessWidget {
  const DashboardChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            // drawVerticalLine: true,
            // horizontalInterval: 10,
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
          titlesData: FlTitlesData(
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
                reservedSize: 42,
              ),
            ),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
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

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('9-10am', style: style);
        break;
      case 1:
        text = const Text('10-11am', style: style);
        break;
      case 2:
        text = const Text('11-12pm', style: style);
        break;
      case 3:
        text = const Text('12-1pm', style: style);
        break;
      case 4:
        text = const Text('1-2pm', style: style);
        break;
      case 5:
        text = const Text('2-3pm', style: style);
        break;
      case 6:
        text = const Text('4-5pm', style: style);
        break;
      case 7:
        text = const Text('5-6pm', style: style);
        break;
      case 8:
        text = const Text('6-7pm', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 10:
        text = '10';
        break;
      case 20:
        text = '20';
        break;
      case 30:
        text = '30';
        break;
      case 40:
        text = '40';
        break;
      case 50:
        text = '50';
        break;
      default:
        return Container();
    }
    return Text(text, style: style, textAlign: TextAlign.center);
  }
}
