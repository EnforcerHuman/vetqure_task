import 'package:flutter/material.dart';
import 'package:vetqure_task/constants/colors.dart';
import 'package:vetqure_task/widgets/common/section_header.dart';
import 'package:vetqure_task/widgets/walk_in_client_chart_widgets/client_summary.dart';
import 'package:vetqure_task/widgets/walk_in_client_chart_widgets/walk_in_chart.dart';

class WalkInDataCard extends StatelessWidget {
  const WalkInDataCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var isLargeScreen = constraints.maxWidth > 1300;
      double cardHeight = isLargeScreen ? 300 : constraints.maxHeight * 0.1;
      var media = MediaQuery.of(context).size;
      double cardWidth =
          media.width > 1300 ? media.width * 0.62 : media.width * 0.9;

      return SizedBox(
        height: cardHeight,
        width: cardWidth,
        child: Card(
          elevation: 4,
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SectionHeader(
                isFilter: true,
                title: 'Walk In Clients',
              ),
              const Row(
                children: [
                  ClientSummary(
                      count: '20', isDown: false, category: 'Total Walk In'),
                  ClientSummary(
                      count: '20', isDown: true, category: 'Total Walk In'),
                  ClientSummary(
                      count: '20', isDown: true, category: 'Total Walk In'),
                ],
              ),
              WalkInChart(height: cardHeight * 0.5, width: cardWidth * 0.9)
            ],
          ),
        ),
      );
    });
  }
}
