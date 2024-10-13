import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final int? percentage;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(value,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              if (percentage != null) ...[
                const SizedBox(width: 8),
                Text(
                  '${percentage! > 0 ? '+' : ''}$percentage%',
                  style: TextStyle(
                    color: percentage! > 0 ? Colors.green : Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
