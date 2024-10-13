import 'package:flutter/material.dart';

class StatusIndicator extends StatelessWidget {
  final Color color;
  final String text;
  final double width; // Keep this parameter for custom widths

  const StatusIndicator({
    super.key,
    required this.color,
    required this.text,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double containerHeight = constraints.maxHeight * 0.50;
        double containerWidth = width;
        double fontSize = containerHeight * 0.4;

        return Container(
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
