import 'package:flutter/material.dart';
import 'package:vetqure_task/constants/revenue_section_constants.dart';
import 'package:vetqure_task/widgets/revenue_section/circular_progress_indicator.dart';

class RevenueCard extends StatelessWidget {
  const RevenueCard({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    double width = media.width;
    double height = media.height;
    double cardHeight = height * 0.2;
    return SizedBox(
      width: width / 1.22,
      child: Card(
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: indicatorsData.map((data) {
                return buildCircularIndicator(
                  data['category'],
                  data['amount'],
                  data['percentage'],
                  cardHeight,
                  data['color'],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildCircularIndicator(String category, String amount, double percentage,
    double cardHeight, Color color) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: CustomCircularProgressIndicator(
      category: category,
      amount: amount,
      percentage: percentage,
      backgroundColor: Colors.grey,
      foregroundColor: color,
      size: cardHeight,
      strokeWidth: 15,
    ),
  );
}
