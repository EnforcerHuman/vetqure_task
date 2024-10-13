import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final String title;
  final Icon icon;
  final double fontSize;
  final double padding;

  const NavItem({
    super.key,
    required this.title,
    required this.icon,
    required this.fontSize,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
