import 'package:flutter/material.dart';
import 'package:vetqure_task/widgets/common/section_header.dart';
import 'package:vetqure_task/widgets/revenue_expense_section/revenue_expense_chart.dart';

class RevenuExpenseTrackerCard extends StatelessWidget {
  const RevenuExpenseTrackerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Get screen size details
        var isLargeScreen = constraints.maxWidth > 660;
        double cardHeight = isLargeScreen ? 300 : constraints.maxHeight * 0.9;
        var media = MediaQuery.of(context).size;
        double cardWidth = isLargeScreen ? media.width * 0.3 : media.width - 50;
        double smallsize = media.width - 50;
        double largesize = media.width * 0.3;
        ;
        return SizedBox(
          height: cardHeight,
          width: isLargeScreen ? largesize : smallsize,
          child: Card(
            elevation: 4,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SectionHeader(
                  title: 'Revenue Vs. Expense Tracker',
                  isFilter: false,
                ),
                SizedBox(
                  height: cardHeight * 0.8,
                  child: const RevenueExpenseChart(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
