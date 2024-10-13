import 'package:flutter/material.dart';
import 'package:vetqure_task/widgets/user_demographics/user_demographic_card.dart';

import '../walk_in_client_chart_widgets/walk_in_data_card.dart';

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
