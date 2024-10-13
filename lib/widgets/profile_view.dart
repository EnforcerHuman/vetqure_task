import 'package:flutter/material.dart';
import 'package:vetqure_task/constants/colors.dart';

class ProfieViewWidget extends StatelessWidget {
  const ProfieViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const VerticalDivider(
          color: AppColors.textBlack,
          thickness: 550,
          width: 10,
        ),
        const SizedBox(
          width: 5,
        ),
        CircleAvatar(
          child: Image.asset('assets/images/Img.png'),
        ),
        const SizedBox(
          width: 5,
        ),
        const Text('Name'),
        const Icon(Icons.keyboard_arrow_down)
      ],
    );
  }
}
