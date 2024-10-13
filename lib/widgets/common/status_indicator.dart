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
        double containerHeight = constraints.maxHeight *
            0.15; // Set dynamic height (15% of parent height)
        double containerWidth =
            width; // Use passed width or constraints.maxWidth to make it more flexible
        double fontSize =
            containerHeight * 0.4; // Font size relative to container height

        return Container(
          height: containerHeight, // Dynamically set height
          width: containerWidth, // Dynamically set width
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30), // Rounded edges
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize, // Dynamically set font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
