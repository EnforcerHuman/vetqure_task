import 'package:flutter/material.dart';
import 'package:vetqure_task/widgets/common/status_indicator.dart';

class StaffItem extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const StaffItem(
      {super.key, required this.buttonText, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = constraints.maxWidth * 0.04;
        return ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.04),
          leading: CircleAvatar(
            radius: constraints.maxWidth * 0.06,
            backgroundColor: Colors.grey[200],
            child: Image.asset('assets/images/staff.png'),
          ),
          title: Text(
            'Order Id',
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Date Placed',
            style: TextStyle(fontSize: fontSize * 0.8),
          ),
          trailing: StatusIndicator(
            color: buttonColor,
            text: buttonText,
            width: constraints.maxWidth * 0.25,
          ),
        );
      },
    );
  }
}
