import 'package:flutter/material.dart';
import 'package:vetqure_task/widgets/recent_orders/recent_orders_card.dart';
import 'package:vetqure_task/widgets/revenue_expense_section/revenu_expense_tracker_card.dart';
import 'package:vetqure_task/widgets/staff_availability/staff_availability_card.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final bool isSmallScreen = media.width < 1300;

    debugPrint("BottomSection isSmallScreen: $isSmallScreen");

    if (isSmallScreen) {
      return const Column(
        children: [
          RevenuExpenseTrackerCard(),
          SizedBox(height: 16),
          RecentOrdersCard(),
          SizedBox(height: 16),
          StaffAvailabilityCard()
        ],
      );
    }

    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RevenuExpenseTrackerCard(),
        RecentOrdersCard(),
        StaffAvailabilityCard()
      ],
    );
  }
}
