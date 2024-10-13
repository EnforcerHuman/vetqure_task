import 'package:flutter/material.dart';
import 'package:vetqure_task/widgets/walk_in_client_chart_widgets/metrics_card.dart';

class DashboardMetrics extends StatelessWidget {
  final bool isLargeScreen;

  const DashboardMetrics({Key? key, required this.isLargeScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double itemWidth =
            isLargeScreen ? constraints.maxWidth / 3 : constraints.maxWidth;
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            SizedBox(
              width: itemWidth,
              child: const MetricCard(title: 'Total Walk In', value: '20'),
            ),
            SizedBox(
              width: itemWidth,
              child: const MetricCard(
                  title: 'New Client', value: '20', percentage: -20),
            ),
            SizedBox(
              width: itemWidth,
              child: const MetricCard(
                  title: 'New Client', value: '20', percentage: -20),
            ),
          ],
        );
      },
    );
  }
}
