import 'dart:math';
import 'package:flutter/material.dart';

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
              painter: _CircularProgressPainter(
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
          const SizedBox(
              width: 10), // Space between the circular indicator and text
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

class _CircularProgressPainter extends CustomPainter {
  final double percentage;
  final double strokeWidth;
  final Color backgroundColor;
  final Color foregroundColor;

  _CircularProgressPainter({
    required this.percentage,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Draw background circle
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw foreground arc
    final foregroundPaint = Paint()
      ..color = foregroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    final sweepAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
