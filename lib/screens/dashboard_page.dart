import 'package:flutter/material.dart';
import 'package:vetqure_task/widgets/dash_board/bottom_section.dart';
import 'package:vetqure_task/widgets/dash_board/top_section.dart';
import 'package:vetqure_task/widgets/revenue_section/revenue_card.dart';
import 'package:vetqure_task/widgets/side_bar.dart';
import 'package:vetqure_task/widgets/top_nav_bar.dart';

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
    final bool isLargeScreen = screenWidth >= 1300;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 240, 240),
      body: Row(
        children: [
          if (isLargeScreen) const SideBarWidget(),
          SingleChildScrollView(
            child: Column(
              children: [
                TopNavBar(
                  sidebarwidth: isLargeScreen ? 200 : 0,
                ),
                Padding(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
