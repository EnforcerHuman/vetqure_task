import 'package:flutter/material.dart';
import 'package:vetqure_task/widgets/dash_board/dasboard_view.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 240, 240),
        body: DasboardView());
  }
}
