import 'package:flutter/material.dart';
import 'package:vetqure_task/widgets/recent_orders/recent_orders_card.dart';
import 'package:vetqure_task/widgets/revenue_expense_section/revenu_expense_tracker_card.dart';
import 'package:vetqure_task/widgets/revenue_section/revenue_card.dart';
import 'package:vetqure_task/widgets/side_bar.dart';
import 'package:vetqure_task/widgets/staff_availability/staff_availability_card.dart';
import 'package:vetqure_task/widgets/user_demographics/user_demographic_card.dart';
import 'package:vetqure_task/widgets/walk_in_client_chart_widgets/walk_in_data_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
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
    final bool isLargeScreen = screenWidth >= 1400;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 240, 240),
      body: Row(
        children: [
          if (isLargeScreen) const SideBarWidget(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TopSection(isLargeScreen: isLargeScreen),
                  const RevenueCard(),
                  const BottomSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  final bool isLargeScreen;
  const TopSection({super.key, required this.isLargeScreen});

  @override
  Widget build(BuildContext context) {
    if (isLargeScreen) {
      return const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          WalkInDataCard(),
          UserDemographicCard(),
        ],
      );
    } else {
      return const Column(
        children: [
          WalkInDataCard(),
          UserDemographicCard(),
        ],
      );
    }
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final bool isSmallScreen = media.width < 1300;

    debugPrint("BottomSection isSmallScreen: $isSmallScreen");

    // For small screens, stack widgets vertically in a Column
    if (isSmallScreen) {
      return const Column(
        children: [
          RevenuExpenseTrackerCard(),
          SizedBox(height: 16), // Add spacing between widgets
          RecentOrdersCard(),
          SizedBox(height: 16),
          StaffAvailabilityCard()
        ],
      );
    }

    // For large screens, display them in a Row
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
