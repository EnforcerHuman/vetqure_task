import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vetqure_task/widgets/revenue_section/circular_progress_painter.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final String category;
  final String amount;
  final double percentage;
  final double strokeWidth;
  final Color backgroundColor;
  final Color foregroundColor;
  final double size;

  const CustomCircularProgressIndicator({
    super.key,
    required this.percentage,
    this.strokeWidth = 10,
    this.backgroundColor = Colors.grey,
    this.foregroundColor = Colors.blue,
    required this.size,
    required this.category,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size + 50,
      height: size,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 200,
            child: CustomPaint(
              painter: CircularProgressPainter(
                percentage: percentage,
                strokeWidth: strokeWidth,
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
              ),
              child: Center(
                child: Text(
                  '${percentage.toInt()}%',
                  style: TextStyle(
                    fontSize: size * 0.18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Text Section
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  amount,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
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
