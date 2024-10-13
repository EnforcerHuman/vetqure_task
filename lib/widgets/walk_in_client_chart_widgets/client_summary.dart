import 'package:flutter/material.dart';

class ClientSummary extends StatelessWidget {
  final String count;
  final bool isDown;
  final String category;
  const ClientSummary(
      {super.key,
      required this.count,
      required this.isDown,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(count),
                  if (isDown)
                    const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_downward,
                            color: Colors.red,
                          ),
                          Text('20%'),
                        ],
                      ),
                    ),
                ],
              ),
              Text(category),
            ],
          ),
        ],
      ),
    );
  }
}
