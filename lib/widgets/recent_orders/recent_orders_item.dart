import 'package:flutter/material.dart';
import 'package:vetqure_task/widgets/common/status_indicator.dart';

class RecentOrdersItem extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const RecentOrdersItem({
    super.key,
    required this.buttonText,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate font size based on the maximum width of the container
        double fontSize = constraints.maxWidth * 0.04;
        double subtitleFontSize = fontSize * 0.8;

        // Calculate sizes for other elements
        double avatarRadius = constraints.maxWidth * 0.06;
        double trailingWidth =
            constraints.maxWidth * 0.25; // Adjusted for better fit

        return ListTile(
          leading: CircleAvatar(
            radius: avatarRadius,
            child: Image.asset('assets/images/order_image.png'),
          ),
          title: Text(
            'Order Id',
            style: TextStyle(fontSize: fontSize),
          ),
          subtitle: Text(
            'Date Placed',
            style: TextStyle(fontSize: subtitleFontSize),
          ),
          trailing: SizedBox(
            width: trailingWidth,
            child: StatusIndicator(
              color: buttonColor,
              text: buttonText,
              width: trailingWidth,
            ),
          ),
        );
      },
    );
  }
}
